module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|

        <div class="sr-root">
          <div class="sr-main">
            <section class="container">
              <div>
                <h1>Single photo</h1>
                <h4>Purchase a Pasha original photo</h4>

                <div class="pasha-image">
                  <img
                    src="https://picsum.photos/280/320?random=4"
                    width="140"
                    height="160"
                    />
                </div>
              </div>

              <form action="/create-checkout-session" method="POST">
                <button id="submit">Buy</button>
              </form>
            </section>

            <div id="error-message"></div>
          </div>
        </div>
|]
