package nslm2.modules.dungeons.scripts.configs
{
   public class ScriptConfigVo
   {
       
      
      public var cmd:String;
      
      public var script_name_cn:String;
      
      public var params:Array;
      
      public var param_prompt:String;
      
      public function ScriptConfigVo(param1:String, param2:String, param3:Array, param4:String)
      {
         super();
         cmd = param1;
         script_name_cn = param2;
         params = param3;
         this.param_prompt = param4;
      }
   }
}
