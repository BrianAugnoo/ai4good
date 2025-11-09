class CriteriumController < ApplicationController
  def create
    group = Group.find(params[:group_id].to_i)
    begin
      @criterium_category = CriteriumCategory.find(params[:criterium_category_id])
      CriteriumCategory.categories[@criterium_category.name].each do |key, value|
        Criterium.create!(
          examiner_id: current_examiner.id,
          name: key,
          group_id: params[:group_id].to_i,
          criterium_category_id: params[:criterium_category_id].to_i,
          values: params[key.to_sym]
        )
      end
      group.validate
    rescue => e
      raise e
    end
      redirect_to group_path(group)
  end

  def new
    @criterium_category = CriteriumCategory.where(name: params[:categorie])[0]
    @group_id = Group.find(params[:group_id]).id
  end
end
