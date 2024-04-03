<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Login</title>
  </head>
  <body>
    <h2>Login</h2>
    <form action="/login" method="post">
      <input
        type="text"
        name="username"
        placeholder="Username"
        required
      /><br />
      <input
        type="password"
        name="password"
        placeholder="Password"
        required
      /><br />
      <button type="submit">Login</button>
    </form>
  </body>
</html>
