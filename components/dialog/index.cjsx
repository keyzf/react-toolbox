localCSS    = require './style'
Button      = require '../button'
Navigation  = require '../navigation'

module.exports = React.createClass

  # -- States & Properties
  propTypes:
    actions     : React.PropTypes.array
    active      : React.PropTypes.bool
    className   : React.PropTypes.string
    title       : React.PropTypes.string
    type        : React.PropTypes.string

  getDefaultProps: ->
    actions     : []
    className   : 'normal'

  getInitialState: ->
    active      : @props.active

  # -- Render
  render: ->
    className  = "#{localCSS.root} #{@props.className}"
    className += " #{@props.type}"  if @props.type
    className += ' active'          if @state.active
    <div data-react-toolbox='dialog' data-flex='vertical center' className={className}>
      <div className={localCSS.container}>
        {<h1>{@props.title}</h1>}
        {@props.children}
        {<Navigation actions={@props.actions}/> if @props.actions.length > 0}
      </div>
    </div>

  # -- Extends
  show: ->
    @setState active: true

  hide: ->
    @setState active: false