app = angular.module 'weather-data-app', []

track_wetness_str = [
        "Unknown",
        "Dry",
        "Mostly Dry",
        "Very Lightly Wet",
        "Lightly Wet",
        "Moderately Wet",
        "Very Wet",
        "Extremely Wet",
    ]

app.service 'iRService', ($rootScope) ->
    ir = new IRacing ['TrackWetness', 'Precipitation', 'Skies'], [], 10

    ir.onConnect = ->        
        
        ir.data.CustomLastPrecipitation = 0
        ir.data.CustomPrecipitationState = 0
        ir.data.CustomPrecipitationStr = '0.0%'

        $rootScope.$apply()
        console.log 'connected'

    ir.onDisconnect = ->
        console.log 'disconnected'

    ir.onUpdate = (keys) ->
        $rootScope.$apply()

    return ir

app.controller 'WeatherCtrl', ($scope, iRService) ->
    $scope.ir = ir = iRService.data

    $scope.$watch 'ir.TrackWetness', onTrackWetness = (w) ->
        
        console.log 'TrackWetness: ', w
        if w != undefined 
            ir.CustomTrackWetnessStr = track_wetness_str[w]

    $scope.$watch 'ir.Precipitation', onPrecipitation = (p) ->
        console.log 'Precipitation: ', p
        if p != undefined 

            if p == 0
                ir.CustomPrecipitationState = 0
            else if p > ir.CustomLastPrecipitation
                ir.CustomPrecipitationState = 1
            else if p < ir.CustomLastPrecipitation
                ir.CustomPrecipitationState = 2
        
            ir.CustomPrecipitationStr = (p * 100).toFixed(1) + '%'
            ir.CustomLastPrecipitation = p
        

angular.bootstrap document, [app.name]