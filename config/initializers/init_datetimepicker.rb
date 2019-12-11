# Example "11/03/2016 13:00"
ActiveAdminDatetimepicker::Base.default_datetime_picker_options = {
    format: 'Y/m/d H:i', # JS format
    defaultTime: proc { Time.current.strftime('%H:00') } # not necessary
}
ActiveAdminDatetimepicker::Base.format = "%Y-%m-%d %H:%M" # Ruby format