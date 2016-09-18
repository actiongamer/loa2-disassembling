package nslm2.modules.footstones.tooltipsModules.uis
{
   import nslm2.modules.battles.resourceDungeons.GainExtraTipVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.List;
   import nslm2.modules.battles.resourceDungeons.ResDgExtrawardVo;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   
   public class TooltipGainExtra extends TooltipUICommon
   {
       
      
      public function TooltipGainExtra()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         var _loc8_:int = 0;
         var _loc5_:* = null;
         var _loc3_:GainExtraTipVo = param1 as GainExtraTipVo;
         this.addTxt(LocaleMgr.ins.getStr(999000183));
         this.addLine();
         var _loc4_:List = new List();
         _loc4_.repeatY = _loc3_.extraVoArr.length;
         var _loc6_:Array = [];
         var _loc7_:int = _loc3_.extraVoArr.length;
         _loc8_ = 0;
         while(_loc8_ < _loc7_)
         {
            _loc5_ = _loc3_.extraVoArr[_loc8_];
            _loc6_.push(TextFieldUtil.htmlText(LocaleMgr.ins.getStr(999000184,[_loc5_.need,_loc5_.gain]) + " " + (_loc3_.count >= _loc5_.need?LocaleMgr.ins.getStr(999000185):""),new TextFormat(null,null,_loc3_.count >= _loc5_.need?458496:14210735)));
            _loc8_++;
         }
         _loc4_.array = _loc6_;
         this.addChild(_loc4_);
         this.validateSize();
      }
   }
}
