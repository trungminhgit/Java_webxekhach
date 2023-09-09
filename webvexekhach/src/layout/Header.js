import { useContext, useEffect, useState } from "react";
import { Badge, Button, Col, Container, Form, Nav, Navbar, NavDropdown, Row } from "react-bootstrap";
import { Link, useNavigate } from "react-router-dom";
import { MyCartContext, MyUserContext } from "../App";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "./MySpinner";

const Header = () => {
    const [user, dispatch] = useContext(MyUserContext);
    const [cartCounter,] = useContext(MyCartContext);
    const [routes, setRoutes] = useState(null);
    const [kw, setKw] = useState("");
    const nav = useNavigate();

    const loadRoutes = async () => {
        let res = await Apis.get(endpoints['routes'])
        setRoutes(res.data);
    }

    useEffect(() => {
        loadRoutes();
    }, [])

    const search = (evt) => {
        evt.preventDefault();
        nav(`/?kw=${kw}`)
    }

    const logout = () => {
        dispatch({
            "type": "logout"
        })
    }

    if (routes === null)
        return <MySpinner />;

    return (
        <>
            <Navbar expand="lg" className="bg-body-tertiary" style={{ width: '100%' }}>
                <Container>
                    <Navbar.Brand href="/" style={{ fontSize: '35px', color: 'Highlight' }}>&#128652; FutaBusLine-Website</Navbar.Brand>
                    <Navbar.Toggle aria-controls="basic-navbar-nav" />
                    <Navbar.Collapse id="basic-navbar-nav">
                        <Nav className="me-auto">
                            <Link className="nav-link" to="/">&#127968; Trang chủ</Link>
                            <NavDropdown title="&#128457;Danh mục tuyến xe" id="basic-nav-dropdown">
                                {routes.map(r => {
                                    let h = `/?routeId=${r.id}`;
                                    return <Link className="dropdown-item" to={h} key={r.id}>{r.routeName}</Link>
                                })}
                            </NavDropdown>
                            {user === null ? <>
                                <Link className="nav-link text-danger" to="/login">&#128589;Đăng nhập</Link>
                                <Link className="nav-link text-danger" to="/register">&#9997;Đăng ký</Link>
                            </> : <>
                                <Link className="nav-link text-danger" to="/">Chào {user.firstName}!</Link>
                                <Button variant="secondary" onClick={logout}>Đăng xuất</Button>
                            </>}
                            <Link className="nav-link text-danger" to="/cart">&#128722; <Badge bg="danger">{cartCounter}</Badge></Link>
                        </Nav>
                    </Navbar.Collapse>
                    <Form onSubmit={search} inline>
                        <Row>
                            <Col xs="auto">
                                <Form.Control
                                    type="text"
                                    value={kw}
                                    onChange={e => setKw(e.target.value)}
                                    placeholder="Nhập từ khóa..." name="kw"
                                    className=" mr-sm-2"
                                />
                            </Col>
                            <Col xs="auto">
                                <Button type="submit">Tìm</Button>
                            </Col>
                        </Row>
                    </Form>
                </Container>
            </Navbar>
        </>
    )
}
export default Header;