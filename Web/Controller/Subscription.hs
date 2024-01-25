module Web.Controller.Subscription where

import Web.Controller.Prelude
import Web.View.Subscription.Index
import Web.View.Subscription.New
import Web.View.Subscription.Edit
import Web.View.Subscription.Show
import Web.View.Static.Subscribe (SubscribeView)


instance Controller SubscriptionController where
    action SubscribeAction = render $ SubscribeView {}

    action NewSubscriptionAction = do
        let subscription = newRecord
        render NewView { .. }

    action ShowSubscriptionAction { subscriptionId } = do
        subscription <- fetch subscriptionId
        render ShowView { .. }

    action EditSubscriptionAction { subscriptionId } = do
        subscription <- fetch subscriptionId
        render EditView { .. }

    action UpdateSubscriptionAction { subscriptionId } = do
        subscription <- fetch subscriptionId
        subscription
            |> buildSubscription
            |> ifValid \case
                Left subscription -> render EditView { .. }
                Right subscription -> do
                    subscription <- subscription |> updateRecord
                    setSuccessMessage "Subscription updated"
                    redirectTo EditSubscriptionAction { .. }

    action CreateSubscriptionAction = do
        let subscription = newRecord @Subscription
        subscription
            |> buildSubscription
            |> ifValid \case
                Left subscription -> render NewView { .. } 
                Right subscription -> do
                    subscription <- subscription |> createRecord
                    setSuccessMessage "Subscription created"
                    redirectTo SubscriptionsAction

    action DeleteSubscriptionAction { subscriptionId } = do
        subscription <- fetch subscriptionId
        deleteRecord subscription
        setSuccessMessage "Subscription deleted"
        redirectTo SubscriptionsAction

buildSubscription subscription = subscription
    |> fill @'[]
