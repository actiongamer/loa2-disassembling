package nslm2.modules.dungeons.scripts
{
   import nslm2.modules.dungeons.scripts.cmds.ScriptCmdBase;
   
   public class ScriptUtil
   {
       
      
      public function ScriptUtil()
      {
         super();
      }
      
      public static function jsonToCmd(param1:Array, param2:IScriptBox) : Array
      {
         var _loc7_:int = 0;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc3_:Array = [];
         var _loc5_:int = param1.length;
         _loc7_ = 0;
         while(_loc7_ < _loc5_)
         {
            _loc4_ = param1[_loc7_];
            _loc6_ = ScriptCmdBase.parse(_loc4_);
            if(!(_loc6_.vo.cmd == "end" && _loc6_.vo.disabled == false))
            {
               _loc6_.vo.script_index = _loc7_;
               _loc6_.module = param2;
               _loc3_.push(_loc6_);
               _loc7_++;
               continue;
            }
            break;
         }
         return _loc3_;
      }
   }
}
