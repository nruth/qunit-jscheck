qunitify = (jsCheckObj)->
  QUnit.module(jsCheckObj.group || 'JSCheck ungrouped')
  QUnit.test "#{jsCheckObj.group} #{jsCheckObj.name} #{jsCheckObj.args}", ()->
    ok jsCheckObj.pass

JSC.on_fail (object)-> qunitify(object)
JSC.on_lost (object)-> qunitify(object)
# JSC.on_pass (object)-> qunitify(object)

JSC.on_result (obj)->
  QUnit.module 'JSCheck Result'
  QUnit.test(
    "#{obj.total} cases: #{obj.pass}✓, #{obj.fail}✗, #{obj.lost} lost", ->
      ok(obj.ok, "Some JSCheck cases failed")
  )
