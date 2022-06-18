defmodule MyAppWeb.Components.Form.TextInput do
  @moduledoc """
  The text field component as defined here: https://bulma.io/documentation/form/input/
  """

  use Surface.LiveComponent

#  @doc "Max length of field, as enforced by client browser. Not validated by Elixir."
#  prop(maxlength, :integer)

#  @doc "Minimum length of field, as enforced by client browser. Not validated by Elixir."
#  prop(minlength, :integer)

  @doc "The infiel field's label."
  prop label, :string, default: nil

  @doc "Expand the control the full width if true."
  prop expanded, :boolean

  @doc "The input element's name."
  prop name, :string, required: true

  @doc "The initial value of the input element."
  prop value, :string, default: nil

  @doc "Show loading spinner if loading."
  prop loading, :boolean

  @doc "The custom classes for the input element."
  prop class, :any, default: []

  @doc "Additional dynamic attributes for input element."
  prop opts, :any, default: {[]}

  @doc "The placeholder in the input box before entry."
  prop placeholder, :string, default: nil

  @doc "Icon to place on the left side of input box. Must be a valid icon."
  prop icon_left, :any, default: nil

  @doc "Icon to place on the right side of input box. Must be a valid icon."
  prop icon_right, :any, default: nil

  @doc "Help text placed below the input field."
  prop help_text, :string, default: nil

  @doc "Placeholder value"
#  prop placeholder, :string, default: nil

  @doc "Whether the input has addons"
#  prop has_addons, :boolean, default: false

#  prop field, :any

  @doc "Attrs to add to the control div"
#  prop control_attrs, :map, default: %{}

  @doc "Disable default fontawesome icons tied to validation"
#  prop(disable_icons, :boolean, default: false)

  slot left_addon
  slot right_addon

  #<TextInput
  #  name={:name}
  #  value={@name}
  #  expanded="true"
  #  opts={[phx_debounce: 500, autocomplete: "off"]}
  #  placeholder="Player name"
  #  help_text="Use ^ at the beginning to &quote;start with&quote; and $ at the end to &quote;end with&quote;"
  #>
  #  <:right_addon>
  #    <Button color="link"><FA icon="magnifying-glass" />&#160;Search</Button>
  #  </:right_addon>
  #</TextInput>

#  <div class="field">
#    <label class="label">{}</label>
#    <div class="control has-icons-left has-icons-right">
#      <input class="input is-success" type="text" placeholder="Text input" value="bulma">
#      <#slot name="left_addon" />
#      <span class="icon is-small is-left">
#        <i class="fas fa-user"></i>
#      </span>
#      <span class="icon is-small is-right">
#        <i class="fas fa-check"></i>
#      </span>
#      <#slot name="left_addon" />
#    </div>
#    <p class="help is-success">This username is available</p>
#  </div>


  def render(assigns) do
    ~F"""
    <div class={"field", "has-addons": @left_addon || @right_addon}>
      <label :if={@label} class="label">{@label}</label>
      <div id={@id} class={"control", "has-icons-left": @icon_left, "has-icons-right": @icon_right, "is-expanded": @expanded, "is-loading": @loading}>
        <input name={@name} class={"input", @class} type="text" placeholder={@placeholder} value={@value} {...@opts}>
        {#if @icon_left}
        <span class="icon is-small is-left">
          <i class={"fas", "fa-" <> @icon_left}></i>
        </span>
        {/if}
        {#if @icon_right}
        <span class="icon is-small is-right"><i class={"fas", "fa-" <> @icon_right}></i></span>
        {/if}
        {#if @help_text}
        <p class="help is-success">{@help_text}</p>
        {/if}
      </div>
      <#slot name="left_addon" />
      <#slot name="right_addon" />
    </div>
    """
  end
end
