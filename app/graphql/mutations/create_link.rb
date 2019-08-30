module  Mutations
  class CreateLink < BaseMutation
    # args passed to resolved mtd
    argument :url, String, required: true
    argument :description, String, required: true

    type Types::LinkType

    def resolve(description: nil, url: nil)
      link.create!(
          description: description,
          url: url,
          user: context[:current_user]
      )
    end
  end
end