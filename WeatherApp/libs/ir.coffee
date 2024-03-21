window.IRacing = class IRacing
    constructor: (@requestParams=[], @requestParamsOnce=[], @fps=1, @server='127.0.0.1:8182', @readIbt=false, @record=null) ->
        @data = {}
        @onConnect = null
        @onDisconnect = null
        @onUpdate = null

        @ws = null
        @onWSConnect = null
        @onWSDisconnect = null
        @reconnectTimeout = null

        @connected = false
        @firstTimeConnect = true

        if record?
            @loadRecord()
        else
            @connect()

    connect: ->
        @ws = new WebSocket "ws://#{@server}/ws"
        @ws.onopen = => @onopen.apply @, arguments
        @ws.onmessage = => @onmessage.apply @, arguments
        @ws.onclose = => @onclose.apply @, arguments

    onopen: ->
        @onWSConnect?()

        if @reconnectTimeout?
            clearTimeout @reconnectTimeout

        for k of @data
            delete @data[k]

        @ws.send JSON.stringify
            fps: @fps
            readIbt: @readIbt
            requestParams: @requestParams
            requestParamsOnce: @requestParamsOnce

    onmessage: (event) ->
        data = JSON.parse event.data.replace /\bNaN\b/g, 'null'

        # on disconnect
        if data.disconnected
            @connected = false
            if @onDisconnect
                @onDisconnect()

        # clear data on connect
        if data.connected
            for k of @data
                delete @data[k]

        # on connect or first time connect
        if data.connected or (@firstTimeConnect and not @connected)
            @firstTimeConnect = false
            @connected = true
            if @onConnect
                @onConnect()

        # update data
        if data.data
            keys = []
            for k, v of data.data
                keys.push(k)
                @data[k] = v
            if @onUpdate
                @onUpdate keys

    onclose: ->
        @onWSDisconnect?()
        if @ws
            @ws.onopen = @ws.onmessage = @ws.onclose = null
        if @connected
            @connected = false
            if @onDisconnect
                @onDisconnect()
        @reconnectTimeout = setTimeout (=> @connect.apply @), 2000

    sendCommand: (command, args...) ->
        @ws.send JSON.stringify
            command: command
            args: args

    loadRecord: ->
        r = new XMLHttpRequest()
        r.onreadystatechange = ->
            if r.readyState == 4 and r.status == 200
                data = JSON.parse r.responseText
                console.log data
        r.open 'GET', @record, true
        r.send()
