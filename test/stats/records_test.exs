defmodule Stats.RecordsTest do
  use Stats.DataCase

  alias Stats.Records

  describe "users" do
    alias Stats.Records.User

    @valid_attrs %{date_of_birth: ~D[2010-04-17], email: "some email", gender: "some gender", name: "some name"}
    @update_attrs %{date_of_birth: ~D[2011-05-18], email: "some updated email", gender: "some updated gender", name: "some updated name"}
    @invalid_attrs %{date_of_birth: nil, email: nil, gender: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Records.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Records.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Records.create_user(@valid_attrs)
      assert user.date_of_birth == ~D[2010-04-17]
      assert user.email == "some email"
      assert user.gender == "some gender"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Records.update_user(user, @update_attrs)
      assert user.date_of_birth == ~D[2011-05-18]
      assert user.email == "some updated email"
      assert user.gender == "some updated gender"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_user(user, @invalid_attrs)
      assert user == Records.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Records.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Records.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Records.change_user(user)
    end
  end

  describe "websites" do
    alias Stats.Records.Website

    @valid_attrs %{topic: "some topic", url: "some url"}
    @update_attrs %{topic: "some updated topic", url: "some updated url"}
    @invalid_attrs %{topic: nil, url: nil}

    def website_fixture(attrs \\ %{}) do
      {:ok, website} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_website()

      website
    end

    test "list_websites/0 returns all websites" do
      website = website_fixture()
      assert Records.list_websites() == [website]
    end

    test "get_website!/1 returns the website with given id" do
      website = website_fixture()
      assert Records.get_website!(website.id) == website
    end

    test "create_website/1 with valid data creates a website" do
      assert {:ok, %Website{} = website} = Records.create_website(@valid_attrs)
      assert website.topic == "some topic"
      assert website.url == "some url"
    end

    test "create_website/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_website(@invalid_attrs)
    end

    test "update_website/2 with valid data updates the website" do
      website = website_fixture()
      assert {:ok, %Website{} = website} = Records.update_website(website, @update_attrs)
      assert website.topic == "some updated topic"
      assert website.url == "some updated url"
    end

    test "update_website/2 with invalid data returns error changeset" do
      website = website_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_website(website, @invalid_attrs)
      assert website == Records.get_website!(website.id)
    end

    test "delete_website/1 deletes the website" do
      website = website_fixture()
      assert {:ok, %Website{}} = Records.delete_website(website)
      assert_raise Ecto.NoResultsError, fn -> Records.get_website!(website.id) end
    end

    test "change_website/1 returns a website changeset" do
      website = website_fixture()
      assert %Ecto.Changeset{} = Records.change_website(website)
    end
  end

  describe "visits" do
    alias Stats.Records.Visit

    @valid_attrs %{timestamp: ~T[14:00:00]}
    @update_attrs %{timestamp: ~T[15:01:01]}
    @invalid_attrs %{timestamp: nil}

    def visit_fixture(attrs \\ %{}) do
      {:ok, visit} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_visit()

      visit
    end

    test "list_visits/0 returns all visits" do
      visit = visit_fixture()
      assert Records.list_visits() == [visit]
    end

    test "get_visit!/1 returns the visit with given id" do
      visit = visit_fixture()
      assert Records.get_visit!(visit.id) == visit
    end

    test "create_visit/1 with valid data creates a visit" do
      assert {:ok, %Visit{} = visit} = Records.create_visit(@valid_attrs)
      assert visit.timestamp == ~T[14:00:00]
    end

    test "create_visit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_visit(@invalid_attrs)
    end

    test "update_visit/2 with valid data updates the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{} = visit} = Records.update_visit(visit, @update_attrs)
      assert visit.timestamp == ~T[15:01:01]
    end

    test "update_visit/2 with invalid data returns error changeset" do
      visit = visit_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_visit(visit, @invalid_attrs)
      assert visit == Records.get_visit!(visit.id)
    end

    test "delete_visit/1 deletes the visit" do
      visit = visit_fixture()
      assert {:ok, %Visit{}} = Records.delete_visit(visit)
      assert_raise Ecto.NoResultsError, fn -> Records.get_visit!(visit.id) end
    end

    test "change_visit/1 returns a visit changeset" do
      visit = visit_fixture()
      assert %Ecto.Changeset{} = Records.change_visit(visit)
    end
  end
end
