import React, {memo}  from "react"
import { render }     from "react-dom"

require './styles.sass'

NUM_CARDS = 1000

class Simple extends React.Component
  state:
    card: 5

  setCard: (i)=>
    @setState card: i

  render: ->
    <div className="App #{@state.card}">
      {for i in [1...NUM_CARDS]
        <div
          key={i}
          className="Card #{if i is @state.card then 'selected' else ''}"
          onClick={@setCard.bind(@, i)}
        >
          {i}
        </div>
      }
    </div>



CardComponent = ({i, idx, setCard})->
  <div
    className="Card #{if i is idx then 'selected' else ''}"
    onClick={setCard.bind(@, i)}
  >
    {i}
  </div>

class Components extends React.Component
  state:
    card: 5

  setCard: (i)=>
    @setState card: i

  render: ->
    <div className="App #{@state.card}">
      {for i in [1...NUM_CARDS]
        <CardComponent
          key={i}
          i={i}
          idx={@state.card}
          setCard={@setCard}
        />
      }
    </div>


MemoCardComponent = memo CardComponent

class MemoComponents extends React.Component
  state:
    card: 5

  setCard: (i)=>
    @setState card: i

  render: ->
    <div className="App #{@state.card}">
      {for i in [1...NUM_CARDS]
        <MemoCardComponent
          key={i}
          i={i}
          idx={@state.card}
          setCard={@setCard}
        />
      }
    </div>


App = ->
  <div>
    <div className="testarea">
      <h1>Simple:</h1>
      <Simple />
    </div>
    <div className="testarea">
      <h1>Components:</h1>
      <Components />
    </div>
    <div className="testarea">
      <h1>MemoComponents:</h1>
      <MemoComponents />
    </div>
  </div>



render <App />, document.getElementById "Application"
