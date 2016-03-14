module.exports = (robot) ->
  robot.router.post '/api/post_message', (req, res) ->
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    room   = data.room
    message = data.message

    robot.messageRoom room, message

    res.send 'OK'

  robot.respond /.*/i, (res) ->
    data = JSON.stringify({
      foo: res.message.text
    })
    robot.http("http://localhost:3000/api/receive_message")
      .header('Content-Type', 'application/json')
      .post(data) (err, res, body) ->
        robot.logger.info data
