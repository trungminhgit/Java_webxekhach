
import { useContext, useEffect, useState } from "react";
import { Alert, Button, Col, Form, Image, ListGroup, Row } from "react-bootstrap";
import Moment from "react-moment";
import { Link, useParams } from "react-router-dom";
import { MyUserContext } from "../App";
import Apis, { authApi, endpoints } from "../configs/Apis";
import MySpinner from "../layout/MySpinner";

const TripDetails = () => {
    const [userId,] = useContext(MyUserContext);
    const { tripId } = useParams();
    const [trip, setTrip] = useState(null);
    const [evaluates, setEvaluates] = useState(null);
    const [desciption, setDesciption] = useState();

    useEffect(() => {
        const loadTrip = async () => {
            let { data } = await Apis.get(endpoints['details'](tripId));
            setTrip(data);
        }

        const loadEvaluates = async () => {
            let { data } = await Apis.get(endpoints['evaluates'](tripId));
            setEvaluates(data);
        }

        loadTrip();
        loadEvaluates();
    }, [tripId]);

    const addEvaluate = () => {
        if (!desciption || desciption.trim() !== "") {
            const process = async () => {
                let { data } = await authApi().post(endpoints['add-evaluate'](tripId), {
                    "desciption": desciption
                });

                setEvaluates([...evaluates, data]);
            }
            setDesciption('');
            process();
        } else {
            return <Alert variant="success" className="mt-2">Vui lòng nhập nội dung!</Alert>
        }
    }

    if (trip === null || evaluates === null)
        return <MySpinner />;

    let url = `/login?next=/trips/${tripId}`;
    return <>
        <h1 className="text-center text-info mt-2">CHI TIẾT CHUYẾN XE ({tripId})</h1>
        <Row>
            <Col md={5} xs={6} className="text-center">
                <Image src={trip.vehicleImage} rounded fluid />
            </Col>
            <Col md={5} xs={6}>
                <h2 className="text-danger">{trip.tripName}</h2>
                <p><span style={{ fontWeight: 'bold' }}>Nơi xuất phát:</span> {trip.departurePlace}</p>
                <p><span style={{ fontWeight: 'bold' }}>Giờ xuất phát:</span> {trip.startTime}</p>
                <p><span style={{ fontWeight: 'bold' }}>Số ghế ngồi:</span> {trip.seats}</p>
                <p><span style={{ fontWeight: 'bold' }}>Loại xe:</span> {trip.vehicleName}</p>
                <p><span style={{ fontWeight: 'bold' }}>Giá vé:</span> {trip.price} VNĐ</p>
            </Col>
        </Row>
        <hr />


        {userId === null ? <p>Vui lòng <Link to={url}>đăng nhập</Link> để đánh giá! </p> : <>
            <Form.Control as="textarea" aria-label="With textarea" value={desciption} onChange={e => setDesciption(e.target.value)} placeholder="Nội dung đánh giá" />
            <Button onClick={addEvaluate} className="mt-2" variant="info" disabled={!desciption || desciption.trim() === ""}>Thêm đánh giá</Button>
            <Link to="/" className="mt-2">
                <Button className="mt-2" style={{ marginLeft: '10px' }} variant="info">Hủy</Button>
            </Link>
        </>}
        <hr />
        <ListGroup>
            {evaluates.map(e => <ListGroup.Item id={e.id} className="d-flex justify-content-between align-items-center">
                <div><strong style={{ fontSize: '1.2rem' }}>{e.userId.userName}</strong>: {e.desciption}</div>
                <div><Moment locale="vi" fromNow>{e.createdDate}</Moment></div>
            </ListGroup.Item>)
            }
        </ListGroup>
    </>
}

export default TripDetails;