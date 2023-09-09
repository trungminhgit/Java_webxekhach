
import { useContext, useState } from "react";
import { Alert, Button, Table } from "react-bootstrap";
import cookie from "react-cookies";
import { Link } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";
import { authApi, endpoints } from "../configs/Apis";

const Cart = () => {
    const [, cartDispatch] = useContext(MyCartContext);
    const [user,] = useContext(MyUserContext);
    const [carts, setCarts] = useState(cookie.load("cart") || null);

    const deleteItem = (item) => {
        cartDispatch({
            "type": "dec",
            "payload": 1
        });

        const cartId = `${item.id}_${item.seatNumber}`;

        if (cartId in carts) {
            setCarts(current => {
                delete current[cartId];
                cookie.save("cart", current);
                return current;
            });
        }
    }


    const pay = () => {
        const process = async () => {
            let res = await authApi().post(endpoints['pay'], carts);
            if (res.status === 200) {
                cookie.remove("cart");

                cartDispatch({
                    "type": "update",
                    "payload": 0
                });

                setCarts([]);
            }
        }
        process();
    }

    if (carts === null)
        return <Alert variant="info" className="mt-2">Không có chuyến xe trong giỏ!</Alert>

    if (carts.length === 0)
        return <Alert variant="success" className="mt-2">Thanh toán thành công!</Alert>

    return <>
        <h1 className="text-center text-info mt-2">GIỎ HÀNG</h1>

        <Table striped bordered hover>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên chuyến xe</th>
                    <th>Giá vé</th>
                    <th>Ngày đi</th>
                    <th>Số ghế</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                {Object.values(carts).map(c => {
                    return <tr>
                        <td>{c.id}</td>
                        <td>{c.name}</td>
                        <td>{c.unitPrice} VNĐ</td>
                        <td>{c.startDate}</td>
                        <td>{c.seatNumber}</td>
                        <td style={{ textAlign: 'center', verticalAlign: 'middle' }}>
                            <Button variant="danger" onClick={() => deleteItem(c)}>&times;</Button>
                        </td>
                    </tr>
                })}

            </tbody>
        </Table>
        {user === null ? <p>Vui lòng <Link to="/login?next=/cart">đăng nhập</Link> để thanh toán! </p> :
            <Button variant="info" onClick={pay} className="mt-2 mb-2 float-left">Thanh toán</Button>}
    </>
}

export default Cart;
