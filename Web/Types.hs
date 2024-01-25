module Web.Types where

import IHP.Prelude
import IHP.ModelSupport
import Generated.Types

data WebApplication = WebApplication deriving (Eq, Show)
data StaticController = SubscribeAction deriving (Eq, Show, Data)

data SubscriptionController
    = SubscriptionsAction
    | NewSubscriptionAction
    | ShowSubscriptionAction { subscriptionId :: !(Id Subscription) }
    | CreateSubscriptionAction
    | EditSubscriptionAction { subscriptionId :: !(Id Subscription) }
    | UpdateSubscriptionAction { subscriptionId :: !(Id Subscription) }
    | DeleteSubscriptionAction { subscriptionId :: !(Id Subscription) }
    deriving (Eq, Show, Data)
