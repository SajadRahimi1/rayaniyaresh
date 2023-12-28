import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_nurse/request_nurse_service.dart'
    as service;
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class RequestNurseViewmodel extends GetxController with StateMixin {
  RequestNurseViewmodel({required this.model});
  final RequestNurseModel model;

  final SingletonClass singletonClass = SingletonClass();

  final List<TextEditingController> textEditingControllers =
      List.generate(2, (index) => TextEditingController());

  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    textEditingControllers[0].text = singletonClass.name ?? "";
    textEditingControllers[1].text = singletonClass.phoneNumber ?? "";
  }

  Future<void> sendData() async {
    if (textEditingControllers[0].text.isNotEmpty) {
      loading();
      model.name = textEditingControllers[0].text;
      print(token);
      model.phoneNumber = textEditingControllers[1].text;
      final _request = await service.requestNurses(model, token);
      Get.back();
      if (_request.statusCode == 200) {
        Get.to(
            () => const SuccessReserveScreen(
                  message:
                      "کارشناسان ما در کمتر از 30 دقیقه آینده با شما جهت ارائه توضیحات بیشتر تماس میگیرند",
                ),
            transition: Transition.leftToRight);
      } else {
        networkErrorMessage();
      }
    } else {
      showMessage(
          title: 'خطا',
          message: 'باید نام را وارد کنید',
          type: MessageType.warning);
    }
  }
}

/*
Microsoft.EntityFrameworkCore.DbUpdateException: An error occurred while saving the entity changes. See the inner exception for details.
 ---> Microsoft.Data.SqlClient.SqlException (0x80131904): Cannot insert the value NULL into column 'Address', table 'raya.dbo.ReserveNurses'; column does not allow nulls. INSERT fails.
The statement has been terminated.
   at Microsoft.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__208_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot, Thread threadPoolThread)
--- End of stack trace from previous location ---
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Storage.RelationalCommand.ExecuteReaderAsync(RelationalCommandParameterObject parameterObject, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
ClientConnectionId:b721eb86-2751-465b-89f6-b67355abc713
Error Number:515,State:2,Class:16
   --- End of inner exception stack trace ---
   at Microsoft.EntityFrameworkCore.Update.ReaderModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Update.Internal.SqlServerModificationCommandBatch.ExecuteAsync(IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.Update.Internal.BatchExecutor.ExecuteAsync(IEnumerable`1 commandBatches, IRelationalConnection connection, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(IList`1 entriesToSave, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.ChangeTracking.Internal.StateManager.SaveChangesAsync(StateManager stateManager, Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.SqlServer.Storage.Internal.SqlServerExecutionStrategy.ExecuteAsync[TState,TResult](TState state, Func`4 operation, Func`4 verifySucceeded, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at Microsoft.EntityFrameworkCore.DbContext.SaveChangesAsync(Boolean acceptAllChangesOnSuccess, CancellationToken cancellationToken)
   at NurseRepository.ReserveNurse(ReserveNurse reserveNurse, User user) in /root/raya-backend/raya/Repository/NurseRepository.cs:line 125
   at NurseController.ReserveNurse(ReserveNurseDto reserveNurseDto) in /root/raya-backend/raya/Controllers/NurseController.cs:line 37
   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)
   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at SwaggerBasicAuthMiddleware.InvokeAsync(HttpContext context) in /root/raya-backend/raya/Middlewares/SwaggerAuth.cs:line 38
   at Microsoft.AspNetCore.Authorization.Policy.AuthorizationMiddlewareResultHandler.HandleAsync(RequestDelegate next, HttpContext context, AuthorizationPolicy policy, PolicyAuthorizationResult authorizeResult)
   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)

HEADERS
=======
Host: asiasalamat.ir
User-Agent: Dart/3.0 (dart:io)
Accept-Encoding: gzip
Authorization: 082d9089-1011-433b-8b67-d4933e9d8e30
Content-Type: application/json
Content-Length: 319
user: {"Token":"082d9089-1011-433b-8b67-d4933e9d8e30","Name":"sajad","PhoneNumber":"09214961842","FatherName":"sajad","Birthday":"1402/06/17","BornCity":null,"NationalCode":"05222222222","NationalNumber":null,"Education":"فوق لیسانس","Address":null,"Province":null,"City":null,"Neighborhood":null,"Street":null,"Alley":null,"PostalCode":null,"Unit":null,"EmergancyNumber":null,"code":null,"ImageUrl":null,"ReservedClasses":[],"ReserveNurses":[],"Messages":[],"Id":"23c5eac5-3c7d-44b7-5b93-08dbafd8a4f5","CreatedAt":"2023-12-09T12:15:52.9108566","UpdatedAt":"2023-12-09T12:15:52.9108566"}
*/