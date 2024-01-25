module Web.View.Subscription.Show where
import Web.View.Prelude

data ShowView = ShowView { subscription :: Subscription }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show Subscription</h1>
        <p>{subscription}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Subscriptions" SubscriptionsAction
                            , breadcrumbText "Show Subscription"
                            ]