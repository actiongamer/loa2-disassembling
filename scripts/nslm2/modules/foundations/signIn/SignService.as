package nslm2.modules.foundations.signIn
{
   import proto.CanSignInRes;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   
   public class SignService
   {
      
      private static var _ins:nslm2.modules.foundations.signIn.SignService;
       
      
      public function SignService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.foundations.signIn.SignService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.foundations.signIn.SignService();
         }
         return _ins;
      }
      
      public function onCanGetSignInReq(param1:CanSignInRes) : void
      {
         NpcFuncService.ins.changeCount(11500,param1 && param1.signIn?1:0);
         if(param1 && param1.signIn)
         {
            FSignInModule.hasFirstShowed = false;
         }
      }
   }
}
