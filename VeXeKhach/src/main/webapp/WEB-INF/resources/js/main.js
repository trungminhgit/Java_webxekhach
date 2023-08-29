function deleteTrip(path) {
    if (confirm("Bạn chắc chắn muốn xóa chuyến xe không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204)
                location.reload();
            else
                alert("Hệ thống có lỗi! Vui lòng quay lại sau!");
        });
    }
}


function deleteRoute(path) {
    if (confirm("Bạn chắc chắn muốn xóa tuyến xe không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204) {
                location.reload();
            } else {
                alert("Hệ thống có lỗi! Vui lòng thử lại sau!");
            }
        });
    }
}

function deleteUser(path) {
    if (confirm("Bạn chắc chắn muốn xóa thành viên không?") === true) {
        fetch(path, {
            method: "delete"
        }).then(res => {
            if (res.status === 204) {
                location.reload();
            } else {
                alert("Hệ thống có lỗi! Vui lòng thử lại sau!");
            }
        });
    }
}


document.addEventListener("DOMContentLoaded", function () { //kiểm tra mật khẩu
    const passwordField = document.getElementById("password");
    const confirmPasswordField = document.getElementById("confirmPassword");
    const registerForm = document.getElementById("registerForm");
    const errorLabel = document.getElementById("passwordError");

    registerForm.addEventListener("submit", function (event) {
        if (passwordField.value !== confirmPasswordField.value) {
            event.preventDefault(); // Ngăn gửi dữ liệu lên máy chủ

            errorLabel.textContent = "Mật khẩu nhập lại không đúng!";
            confirmPasswordField.classList.add("is-invalid");
        }
    });

    confirmPasswordField.addEventListener("input", function () {
        if (passwordField.value === confirmPasswordField.value) {
            errorLabel.textContent = "";
            confirmPasswordField.classList.remove("is-invalid");
        }
    });
});



