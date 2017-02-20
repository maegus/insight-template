defimpl Canada.Can, for: Insight.User do

  alias Insight.User

  def can?(user, :update, resource) do
    if user.id == resource.id, do: true, else: false
  end

  def can?(subject, action, resource) do
    raise """
    Unimplemented authorization check for User!  To fix see below...

    Please implement `can?` for User in #{__ENV__.file}.

    The function should match:

    subject:  #{inspect subject}

    action:   #{action}

    resource: #{inspect resource}
    """
  end
end
