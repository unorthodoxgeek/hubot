module.exports = (robot) ->

  robot.router.post '/api/post_message', (req, res) ->
    data   = if req.body.payload? then JSON.parse req.body.payload else req.body
    room   = data.room
    message = data.message

    robot.messageRoom room, message

    res.send 'OK'
