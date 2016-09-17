package nslm2.modules.dungeons.scripts
{
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigList;
   import nslm2.modules.dungeons.scripts.configs.ScriptConfigVo;
   import morn.core.utils.ObjectUtils;
   import org.specter3d.utils.StringUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class ScriptCmdVo
   {
       
      
      public var script_index:int;
      
      public var script_name:String;
      
      public var json_data:Object;
      
      public var cmd:String;
      
      public var disabled:Boolean;
      
      public var url:String;
      
      public var stc_npc_id:int;
      
      public var stc_special_effect_id:int;
      
      public var id:String;
      
      public var tempId:String;
      
      public var kind:int;
      
      public var name:String;
      
      public var head_id:int;
      
      public var hasButton:Boolean;
      
      public var frameRate:int;
      
      public var x:int;
      
      public var offX:int;
      
      public var y:int;
      
      public var offY:int;
      
      public var scaleX:int;
      
      public var scaleY:int;
      
      public var side:int;
      
      public var faceSide:int;
      
      public var rotation:int;
      
      public var rotationX:int;
      
      public var rotationY:int;
      
      public var rotationZ:int;
      
      public var pos:int;
      
      public var loop:int;
      
      public var aim:String;
      
      public var from:int;
      
      public var to:int;
      
      public var layer:int;
      
      public var time:int;
      
      public var fade:int;
      
      public var speed:int;
      
      public var talk:String;
      
      public var frequency:int;
      
      public var range:int;
      
      public var duration:int;
      
      public var fontColor:String;
      
      public var fontSize:int;
      
      public var fontBold:Boolean;
      
      public function ScriptCmdVo()
      {
         super();
      }
      
      public function get show_name() : String
      {
         return "(" + this.script_index + ") " + this.script_name + " [" + this.cmd + "]";
      }
      
      public function parse(param1:Object) : void
      {
         this.json_data = param1;
         this.cmd = param1.cmd;
         this.disabled = param1.disabled;
         var _loc2_:ScriptConfigVo = ScriptConfigList.ins.cmdList.getValue(this.cmd) as ScriptConfigVo;
         ObjectUtils.copyParams(param1,this,_loc2_.params,"",false,true);
         if(name != null && StringUtil.checkStrIsNumber(name) && name.length == 9 && name.slice(0,3) == "997")
         {
            name = LocaleMgr.ins.getStr(name);
         }
         if(talk != null && StringUtil.checkStrIsNumber(talk) && talk.length == 9 && talk.slice(0,3) == "997")
         {
            talk = LocaleMgr.ins.getStr(talk);
         }
      }
   }
}
