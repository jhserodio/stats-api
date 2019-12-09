defmodule Stats.Records do
  @moduledoc """
  The Records context.
  """

  import Ecto.Query, warn: false
  alias Stats.Repo

  alias Stats.Records.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users(limit, skip, sort_field, sort_order)
      [%User{}, ...]

  """
  def list_users(limit, skip, sort_field, sort_order) do
    resultado = {sort_order, sort_field}
    query = from(
      u in User,
      order_by: ^resultado,
      offset: ^skip
    )

    %{entries: entries} = Repo.paginate(
      query,
      cursor_fields: [sort_field],
      limit: limit
    )

    entries
  end


  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id) do
    query = from u in User, where: u.id == ^id
    if Repo.exists?(query) do
      Repo.get!(User, id)
    else
      nil
    end 
  end


  @doc """
  Gets a single user by email.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user_by_email!(joao.serodio@vnator.com)
      %User{}

      iex> get_user_by_email!(carambolas.quadradas@vnator.com)
      ** (Ecto.NoResultsError)

  """
  def get_user_by_email!(email) do
    if user_exist?(email) do
      Repo.get_by!(User, [email: email])
    else
      nil
    end 
  end

  @doc """
  Check if user exist by email.

  ## Examples

      iex> user_exist?(joao.serodio@vnator.com)
      true

      iex> user_exist?(carambolas.quadradas@vnator.com)
      false
  """
  def user_exist?(email) do
    query = from u in User, where: u.email == ^email
    Repo.exists?(query)
  end

  @doc """
  Check if user exist by id.

  ## Examples

      iex> user_exist?(1)
      true

      iex> user_exist?(999999999)
      false
  """
  def user_exist_id?(id) do
    query = from u in User, where: u.id == ^id
    Repo.exists?(query)
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Stats.Records.Website

  @doc """
  Returns the list of websites.

  ## Examples

      iex> list_websites()
      [%Website{}, ...]

  """
  def list_websites do
    Repo.all(Website)
  end

  @doc """
  Returns the list of websites.

  ## Examples

      iex> list_websites(limit, skip, sort_field, sort_order)
      [%User{}, ...]

  """
  def list_websites(limit, skip, sort_field, sort_order) do
    resultado = {sort_order, sort_field}
    query = from(
      w in Website,
      order_by: ^resultado,
      offset: ^skip
    )

    %{entries: entries} = Repo.paginate(
      query,
      cursor_fields: [sort_field],
      limit: limit
    )

    entries
  end

  @doc """
  Gets a single website.

  Raises `Ecto.NoResultsError` if the Website does not exist.

  ## Examples

      iex> get_website!(123)
      %Website{}

      iex> get_website!(456)
      ** (Ecto.NoResultsError)

  """
  def get_website!(id) do
    query = from w in Website, where: w.id == ^id
    if Repo.exists?(query) do
      Repo.get!(Website, id)
    else
      nil
    end 
  end

  @doc """
  Gets a single website by url.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_website_by_url!(www.mercafacil.com)
      %User{}

      iex> get_website_by_url!(w3.c/!!)
      ** (Ecto.NoResultsError)

  """
  def get_website_by_url!(url) do
    if website_exist?(url) do
      Repo.get_by!(Website, [url: url])
    else
      nil
    end 
  end

  @doc """
  Check if website exist by url.

  ## Examples

      iex> website_exist?(www.mercafacil.com)
      true

      iex> website_exist?(w3.c/!!)
      false
  """
  def website_exist?(url) do
    query = from w in Website, where: w.url == ^url
    Repo.exists?(query)
  end

  @doc """
  Check if website exist by id.

  ## Examples

      iex> website_exist?(1)
      true

      iex> website_exist?(999999)
      false
  """
  def website_exist_id?(id) do
    query = from w in Website, where: w.id == ^id
    Repo.exists?(query)
  end

  @doc """
  Creates a website.

  ## Examples

      iex> create_website(%{field: value})
      {:ok, %Website{}}

      iex> create_website(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_website(attrs \\ %{}) do
    %Website{}
    |> Website.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a website.

  ## Examples

      iex> update_website(website, %{field: new_value})
      {:ok, %Website{}}

      iex> update_website(website, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_website(%Website{} = website, attrs) do
    website
    |> Website.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Website.

  ## Examples

      iex> delete_website(website)
      {:ok, %Website{}}

      iex> delete_website(website)
      {:error, %Ecto.Changeset{}}

  """
  def delete_website(%Website{} = website) do
    Repo.delete(website)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking website changes.

  ## Examples

      iex> change_website(website)
      %Ecto.Changeset{source: %Website{}}

  """
  def change_website(%Website{} = website) do
    Website.changeset(website, %{})
  end

  alias Stats.Records.Visit

  @doc """
  Returns the list of visits.

  ## Examples

      iex> list_visits()
      [%Visit{}, ...]

  """
  def list_visits do
    Repo.all(Visit)
  end

  @doc """
  Gets a single visit.

  Raises `Ecto.NoResultsError` if the Visit does not exist.

  ## Examples

      iex> get_visit!(123)
      %Visit{}

      iex> get_visit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_visit!(id), do: Repo.get!(Visit, id)

  @doc """
  Creates a visit.

  ## Examples

      iex> create_visit(%{field: value})
      {:ok, %Visit{}}

      iex> create_visit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_visit(attrs \\ %{}) do
    %Visit{}
    |> Visit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a visit.

  ## Examples

      iex> update_visit(visit, %{field: new_value})
      {:ok, %Visit{}}

      iex> update_visit(visit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_visit(%Visit{} = visit, attrs) do
    visit
    |> Visit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Visit.

  ## Examples

      iex> delete_visit(visit)
      {:ok, %Visit{}}

      iex> delete_visit(visit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_visit(%Visit{} = visit) do
    Repo.delete(visit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking visit changes.

  ## Examples

      iex> change_visit(visit)
      %Ecto.Changeset{source: %Visit{}}

  """
  def change_visit(%Visit{} = visit) do
    Visit.changeset(visit, %{})
  end

  def _mount_stats(visits, users, websites) do

    new_visits = Enum.map(
      visits,
        fn(x) -> %{
          timestamp: x.timestamp,
          user: Enum.find(users, fn(y) -> y.id === x.user_id end),
          website: Enum.find(websites, fn(w) -> w.id === x.website_id end)
        } end
    )

    %{
      users_count: length(users),
      websites_count: length(websites),
      visits_count: length(visits),
      users: users,
      websites: websites,
      visits: new_visits,
    }
  end

  def stats_total(
    initial_timestamp,
    final_timestamp
  ) do

    queryVisits = from(
      v in Visit,
      where: v.timestamp >= ^initial_timestamp and v.timestamp <= ^final_timestamp
    )

    visits = Repo.all(queryVisits)

    userList = Enum.uniq(Enum.map(visits, fn(x) -> x.user_id end))
    queryUsers = from(
      u in User,
      where: u.id in ^userList
    )
    users = Repo.all(queryUsers)

    websiteList = Enum.uniq(Enum.map(visits, fn(x) -> x.website_id end))
    queryWebsites = from(
      w in Website,
      where: w.id in ^websiteList,
    )
    websites = Repo.all(queryWebsites)

    _mount_stats(visits, users, websites)
  end

  def filter_where_webites(websites) do
    if length(websites) > 0 do
      websiteQuery = from(
        w in Website,
        where: w.url in ^websites
      )
      websites = Repo.all(websiteQuery)
      websites_id = Enum.map(websites, fn(x) -> x.id end)
      dynamic([v], v.website_id in ^websites_id)
    else
      true
    end
  end

  def filter_where_users(users) do
    if length(users) > 0 do
      userQuery = from(
          u in User,
          where: u.email in ^users
      )
      users = Repo.all(userQuery)
      users_id = Enum.map(users, fn(x) -> x.id end)
      dynamic([v], v.user_id in ^users_id)
    else
      true
    end
  end

  def filter_where_min_age(min_age) do
    if min_age > 0 do
      userQuery = from(
        u in User,
        where: u.date_of_birth >= ^min_age
      )
      users = Repo.all(userQuery)
      users_id = Enum.map(users, fn(x) -> x.id end)
      dynamic([v], v.user_id in ^users_id)
    else
      true
    end
  end

  def stats_by(args) do

    queryVisits = 
      Visit
        |> where([v], v.timestamp >= ^args.initial_timestamp and v.timestamp <= ^args.final_timestamp)
        |> where(^filter_where_webites(args.websites))
        |> where(^filter_where_users(args.users))
        |> where(^filter_where_min_age(args.min_age))
        

    visits = Repo.all(queryVisits)

    userList = Enum.uniq(Enum.map(visits, fn(x) -> x.user_id end))
    queryUsers = from(
      u in User,
      where: u.id in ^userList
    )
    users = Repo.all(queryUsers)

    websiteList = Enum.uniq(Enum.map(visits, fn(x) -> x.website_id end))
    
    queryWebsites  = from(
      w in Website,
      where: w.id in ^websiteList,
    )
    
    websites = Repo.all(queryWebsites)

    _mount_stats(visits, users, websites)
  end
end
