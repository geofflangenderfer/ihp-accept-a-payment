module Web.View.Subscription.New where
import Web.View.Prelude

data NewView = NewView { subscription :: Subscription }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New Subscription</h1>
        {renderForm subscription}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Subscriptions" SubscriptionsAction
                , breadcrumbText "New Subscription"
                ]

renderForm :: Subscription -> Html
renderForm subscription = formFor subscription [hsx|
    
    {submitButton}

|]