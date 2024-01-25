module Web.View.Subscription.Index where
import Web.View.Prelude

data IndexView = IndexView { subscription :: [Subscription] }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewSubscriptionAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>Subscription</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach subscription renderSubscription}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "Subscriptions" SubscriptionsAction
                ]

renderSubscription :: Subscription -> Html
renderSubscription subscription = [hsx|
    <tr>
        <td>{subscription}</td>
        <td><a href={ShowSubscriptionAction subscription.id}>Show</a></td>
        <td><a href={EditSubscriptionAction subscription.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteSubscriptionAction subscription.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]