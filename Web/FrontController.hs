module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Subscription
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ -- startPage SubscribeAction
        -- Generator Marker
        , parseRoute @SubscriptionController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        setLayout defaultLayout
        initAutoRefresh
