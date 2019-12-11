ActiveAdmin.register Menu do
  permit_params :name, :price
  filter :name
  filter :price
  
  form do |f|
    f.inputs 'メニュー登録' do
      f.input :name
      f.input :price
      f.actions
    end
  end

  index do
    column :id
    column :name
    column :price
    actions
  end

  show do
    attributes_table do
      row 'name' do
        resource.name
      end
      row 'price' do
        resource.price
      end
    end
  end
end
