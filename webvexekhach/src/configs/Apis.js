import axios from "axios";
import cookie from "react-cookies";

const SERVER_CONTEXT = "/VeXeKhach";
const SERVER = "http://localhost:8080";

export const endpoints = {
    "routes": `${SERVER_CONTEXT}/api/routes/`,
    "trips": `${SERVER_CONTEXT}/api/trips/`,
    "login": `${SERVER_CONTEXT}/api/login/`,
    "current-user": `${SERVER_CONTEXT}/api/current-user/`,
    "register": `${SERVER_CONTEXT}/api/register/`,
    "details": (tripId) => `${SERVER_CONTEXT}/api/trips/${tripId}/`,
    "evaluates": (tripId) => `${SERVER_CONTEXT}/api/trips/${tripId}/evaluates/`,
    "add-evaluate": (tripId) => `${SERVER_CONTEXT}/api/trips/${tripId}/evaluates/`,
    "pay": `${SERVER_CONTEXT}/api/pay/`
}

export const authApi = () => {
    return axios.create({
        baseURL: SERVER,
        headers: {
            "Authorization": cookie.load("token")
        }
    })
}

export default axios.create({
    baseURL: SERVER
})