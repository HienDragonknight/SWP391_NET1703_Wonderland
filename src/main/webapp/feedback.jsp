<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback Form</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
  <div class="container mt-5">
    <h2 class="text-center mb-4">Feedback Form</h2>
    <form action="SaveFeedbackServlet" method="post" class="col-md-6 offset-md-3">
      <div class="form-group mb-3">
        <label for="name" class="form-label">Name:</label>
        <input type="text" class="form-control" id="name" name="name" value="${sessionScope.USER_INFO.fullName}">
      </div>
      <div class="form-group mb-3">
        <label for="email" class="form-label">Email:</label>
        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.USER_INFO.email}">
      </div>
      <div class="form-group mb-3">
        <label for="message" class="form-label">Message:</label>
        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Submit</button>
    </form>
  </div>
</body>
</html>
