local res = ngx.location.capture("/api/v1/auth/")
if res.status == ngx.HTTP_NOT_FOUND then
    ngx.status = 418
    ngx.exit(ngx.status)
end

if res.status ~= ngx.HTTP_OK then
    ngx.log(ngx.ERR, "res.status is not 200")
    ngx.status = ngx.HTTP_INTERNAL_SERVER_ERROR
    ngx.exit(ngx.status)
end
