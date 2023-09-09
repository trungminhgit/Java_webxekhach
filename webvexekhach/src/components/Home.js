import { useContext, useEffect, useState } from "react"
import { Alert, Button, Card, Col, Modal, Row } from "react-bootstrap";
import cookie from "react-cookies";
import { Link, useSearchParams } from "react-router-dom";
import { MyCartContext } from "../App";
import Apis, { endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";

const Home = () => {
    const [, cartDispatch] = useContext(MyCartContext);
    const [trips, setTrips] = useState(null);
    const [q] = useSearchParams();
    const [selectedTrip, setSelectedTrip] = useState(null);
    const [showModal, setShowModal] = useState(false);
    const [startDate, setStartDate] = useState();
    const [seatNumber, setSeatNumber] = useState();
    const currentDate = new Date().toISOString().split("T")[0];

    useEffect(() => {
        const loadTrips = async () => {
            try {
                let e = endpoints['trips'];

                let routeId = q.get("routeId");
                if (routeId !== null)
                    e = `${e}?routeId=${routeId}`;
                else {
                    let kw = q.get("kw");
                    if (kw !== null)
                        e = `${e}?kw=${kw}`;
                }

                let res = await Apis.get(e);
                setTrips(res.data);
            } catch (ex) {
                console.error(ex);
            }
        }

        loadTrips();
    }, [q]);

    const order = (trip, selectedStartDate, selectedSeatNumber) => {
        if (selectedSeatNumber > trip.seats) {
            return <Alert variant="success" className="mt-2">Số ghế không hợp lệ!</Alert>
        }
        // lưu vào cookies
        let cart = cookie.load("cart") || null;
        if (cart == null)
            cart = {};
        const cartItemId = `${trip.id}_${selectedSeatNumber}`;

        if (cartItemId in cart) { // sản phẩm có trong giỏ
            if (cart[cartItemId].seatNumber === selectedSeatNumber) { // sản phẩm chưa có trong giỏ
                console.log("Không thể đặt vé cho chuyến xe này với số ghế giống nhau.");
            } else {
                cart[cartItemId] = {
                    "id": trip.id,
                    "name": trip.tripName,
                    "startDate": selectedStartDate,
                    "seatNumber": selectedSeatNumber,
                    "unitPrice": trip.price
                };
                cartDispatch({
                    "type": "inc",
                    "payload": 1
                });
            }
        } else {
            cart[cartItemId] = {
                "id": trip.id,
                "name": trip.tripName,
                "startDate": selectedStartDate,
                "seatNumber": selectedSeatNumber,
                "unitPrice": trip.price
            }
            cartDispatch({
                "type": "inc",
                "payload": 1
            });
        }


        cookie.save("cart", cart);

        console.info(cart);
    }

    const openModal = (trip) => {
        setSelectedTrip(trip);
        setShowModal(true);
        setSeatNumber(""); // Đặt số ghế về trống khi chọn chuyến xe mới

        // Đảm bảo rằng phần tử có id "seatNumber" đã tồn tại trong DOM trước khi cố gắng truy cập thuộc tính "max"
        const seatNumberInput = document.getElementById("seatNumber");
        if (seatNumberInput) {

            // Đặt giới hạn số ghế là số ghế khả dụng của chuyến xe
            const maxSeatNumber = trip.seats;
            seatNumberInput.max = maxSeatNumber.toString();
        }
    }

    const closeAndOrder = () => {
        setShowModal(false);
        // Gọi hàm order ở đây
        if (selectedTrip && startDate && seatNumber) {
            order(selectedTrip, startDate, seatNumber);
        }
        else {
            return <Alert variant="success" className="mt-2">Vui lòng nhập đầy đủ thông tin!</Alert>
        }
    }


    if (trips === null)
        return <MySpinner />

    if (trips.length === 0)
        return <Alert variant="info" className="mt-1">Không có chuyến xe nào!</Alert>

    return (
        <>
            <h2 className="text-center text-info">DANH MỤC CHUYẾN XE</h2>
            <Row>

                {trips.map(t => {
                    let url = `/trips/${t.id}`;

                    return <Col xs={12} md={3} className="mt-2 mb-2">
                        <Card style={{ width: '18rem' }}>
                            <Card.Img variant="top" src={t.vehicleImage} fluid rounded />
                            <Card.Body>
                                <Card.Title><h2 className="text-info" style={{ marginRight: "15px", marginLeft: "50px" }}>{t.tripName}</h2></Card.Title>
                                <Card.Text><span style={{ fontWeight: 'bold' }}>Giá vé:</span> {t.price} VNĐ</Card.Text>
                                <Card.Text><span style={{ fontWeight: 'bold' }}>Nơi xuất phát:</span> {t.departurePlace}</Card.Text>
                                <Link to={url} className="btn btn-info" style={{ marginRight: "15px", marginLeft: "50px" }} variant="primary">Chi tiết</Link>


                                <Button variant="danger" onClick={() => openModal(t)}>Đặt vé</Button>


                            </Card.Body>

                        </Card>
                    </Col>
                })}

            </Row>
            <Modal show={showModal} onHide={() => setShowModal(false)}>
                <Modal.Header closeButton>
                    <Modal.Title>CHỌN NGÀY ĐI VÀ SỐ GHẾ</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    {/* Form chọn ngày đi */}
                    <div className="mb-3">
                        <label htmlFor="startDate" className="form-label">Ngày đi:</label>
                        <input
                            type="date"
                            className="form-control"
                            id="startDate"
                            value={startDate}
                            onChange={(e) => setStartDate(e.target.value)}
                            min={currentDate}
                        />
                    </div>

                    {/* Form chọn số ghế */}
                    <div className="mb-3">
                        <label htmlFor="seatNumber" className="form-label">Số ghế:</label>
                        <input
                            type="number"
                            className="form-control"
                            id="seatNumber"
                            value={seatNumber}
                            onChange={(e) => setSeatNumber(e.target.value)}
                            min="1"
                        />
                    </div>
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="secondary" onClick={() => setShowModal(false)}>Đóng</Button>
                    <Button variant="danger" onClick={closeAndOrder}>Xác nhận</Button>
                </Modal.Footer>
            </Modal>
        </>
    )
}

export default Home;
