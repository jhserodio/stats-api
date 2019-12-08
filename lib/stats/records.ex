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

      iex> list_users()
      [%Website{}, ...]

  """
  def list_users do
    Repo.all(Users)
  end

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
      True

      iex> user_exist?(carambolas.quadradas@vnator.com)
      False
  """
  def user_exist?(email) do
    query = from u in User, where: u.email == ^email
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
      True

      iex> website_exist?(w3.c/!!)
      False
  """
  def website_exist?(url) do
    query = from w in Website, where: w.url == ^url
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
end
