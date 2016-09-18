package nslm2.modules.funnies.npcFuncLists
{
   import morn.core.handlers.Handler;
   import nslm2.types.FunctionType;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.foundations.shop.vo.ShopOpenVo;
   
   public class NpcFuncRef
   {
      
      private static var _ins:nslm2.modules.funnies.npcFuncLists.NpcFuncRef;
       
      
      private var funcDict:Object;
      
      public function NpcFuncRef()
      {
         funcDict = {};
         super();
      }
      
      public static function get ins() : nslm2.modules.funnies.npcFuncLists.NpcFuncRef
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.funnies.npcFuncLists.NpcFuncRef();
         }
         return _ins;
      }
      
      public function regFuncHandler(param1:int, param2:*) : void
      {
         funcDict[param1] = param2;
      }
      
      public function unregFuncHandler(param1:int, param2:*) : void
      {
      }
      
      public function execHandler(param1:int) : void
      {
         var _loc2_:* = funcDict[param1];
         if(_loc2_)
         {
            Handler.execute(_loc2_,[param1]);
         }
         else
         {
            var _loc3_:* = param1;
            if(FunctionType.ALL_SHOP_ARR.indexOf(param1) != -1)
            {
               ModuleMgr.ins.showModule(60300,new ShopOpenVo(param1));
            }
            else if(FunctionType.MYSTERY_SHOP_ARR.indexOf(param1) != -1)
            {
               ModuleMgr.ins.showModule(60310,param1,ModuleMgr.ins.popLayer.curModuleId);
            }
            else
            {
               ModuleMgr.ins.showModule(param1);
            }
         }
      }
   }
}
