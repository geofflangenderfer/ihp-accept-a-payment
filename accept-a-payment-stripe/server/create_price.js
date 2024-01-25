const stripe = require('stripe')('sk_test_51MPCmeIa2YCAcFeYz8ij4I14wzfDqJv8UsMAflU79yP9BA89vQENF5A76D30UQ6eznP3mgXg1PanDB5Md9LfXcBP00EsSThdQq');

async function createOneTimePrice() {
  // any additional code that depends on 'price'
  try {
    const price = await stripe.prices.create({
      currency: 'usd',
      unit_amount: 1000,
      product_data: {
        name: 'Test Price: One Time Payment',
      },
    })
    console.log("price created!:")
    console.log(price)
  } catch (error) {
    console.error(error)
  }
}

async function createRecurringPrice() {
  // any additional code that depends on 'price'
  const price = await stripe.prices.create({
    currency: 'usd',
    unit_amount: 1000,
    recurring: {
      interval: 'month',
    },
    product_data: {
      name: 'Test Price: Gold Plan',
    },
  });
}

createOneTimePrice()
