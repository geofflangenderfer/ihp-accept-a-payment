module Web.View.Subscription.Edit where
import Web.View.Prelude

data EditView = EditView { subscription :: Subscription }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit Subscription</h1>
        {renderForm subscription}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Subscriptions" SubscriptionsAction
                , breadcrumbText "Edit Subscription"
                ]

renderForm :: Subscription -> Html
renderForm subscription = formFor subscription [hsx|
    
    {submitButton}

|]