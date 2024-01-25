module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Subscribe

instance Controller StaticController where
    action SubscribeAction = render SubscribeView
