import { useContext, useState } from "react";
import { Button, Form } from "react-bootstrap";
import cookie from "react-cookies";
import { Navigate, useSearchParams } from "react-router-dom";
import { MyUserContext } from "../App";
import Apis, { authApi, endpoints } from "../configs/Apis";

const Login = () => {
    const [user, dispatch] = useContext(MyUserContext);
    const [userName, setUserName] = useState();
    const [password, setPassword] = useState();
    const [q] = useSearchParams();
    const [loginErrors, setLoginErrors] = useState({ userName: "", password: "" });

    const login = (evt) => {
        evt.preventDefault();
        if (validateForm()) {
            const process = async () => {
                try {
                    let res = await Apis.post(endpoints['login'], {
                        "userName": userName,
                        "password": password
                    });
                    cookie.save("token", res.data);

                    let { data } = await authApi().get(endpoints['current-user']);
                    cookie.save("user", data);

                    dispatch({
                        "type": "login",
                        "payload": data
                    });
                } catch (err) {
                    console.error(err);
                    if (err.response && err.response.status === 400) {
                        setLoginErrors({ userName: "", password: "Vui lòng kiểm tra mật khẩu" });
                    }
                }
            }
            process();
        } else {
            console.log("Dữ liệu không hợp lệ, không submit.");
        }
    }

    if (user !== null) {
        let next = q.get("next") || "/";
        return <Navigate to={next} />
    }

    const validateForm = () => {
        let errors = { userName: "", password: "" };
        let isValid = true;

        if (!userName || userName.trim() === "") {
            errors.userName = "Tên đăng nhập không được để trống";
            isValid = false;
        }

        if (!password || password.trim() === "") {
            errors.password = "Mật khẩu không được để trống";
            isValid = false;
        }

        setLoginErrors(errors);
        return isValid;
    };

    return <>
        <h1 className="text-center text-info">ĐĂNG NHẬP NGƯỜI DÙNG</h1>

        <Form onSubmit={login}>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                <Form.Label>Tên đăng nhập</Form.Label>
                <Form.Control value={userName} onChange={e => setUserName(e.target.value)} type="text" placeholder="Tên đăng nhập" isInvalid={!!loginErrors.userName} />
                <Form.Control.Feedback type="invalid">
                    {loginErrors.userName}
                </Form.Control.Feedback>
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                <Form.Label>Mật khẩu</Form.Label>
                <Form.Control value={password} onChange={e => setPassword(e.target.value)} type="password" placeholder="Mật khẩu" isInvalid={!!loginErrors.password} />
                <Form.Control.Feedback type="invalid">
                    {loginErrors.password}
                </Form.Control.Feedback>
            </Form.Group>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
                <Button variant="info" type="submit">Đăng nhập</Button>
            </Form.Group>
        </Form>
    </>
}

export default Login;