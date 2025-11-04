class CriteriumController < ApplicationController
  def create
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
    rescue => e
      raise e
    end
    if current_examiner.criteria_submited(@group, CriteriumCategory.find(params[:criterium_category_id]).name).any?
      redirect_to group_path(Group.find(params[:group_id].to_i))
    else
      redirect_to group_path(Group.find(params[:group_id].to_i))
    end
  end

  def new
    @criterium_category = CriteriumCategory.where(name: params[:categorie])[0]
    @group_id = Group.find(params[:group_id]).id
  end
end
