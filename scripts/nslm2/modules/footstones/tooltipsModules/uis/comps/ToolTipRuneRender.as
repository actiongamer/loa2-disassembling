package nslm2.modules.footstones.tooltipsModules.uis.comps
{
   import game.ui.tooltipModules.comps.ToolTipRuneRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcBaowuFuwenKeyinVo;
   import morn.core.utils.NumberUtil;
   
   public class ToolTipRuneRender extends ToolTipRuneRenderUI
   {
       
      
      public function ToolTipRuneRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         .super.dataSource = param1[0];
         var _loc6_:String = "";
         var _loc5_:Array = wealthVo.stcItemVo.extend_3.split("|");
         _loc7_ = 0;
         while(_loc7_ < _loc5_.length)
         {
            _loc2_ = NpcPropVo.parseStr(String(_loc5_[_loc7_]),"+");
            _loc3_ = NPCPropConsts.ins.showValue(_loc2_.value,_loc2_.preFix);
            if(_loc2_.isShowColor)
            {
               _loc3_ = TextFieldUtil.htmlText2(_loc3_,_loc2_.getValueColor());
            }
            _loc6_ = _loc6_ + NPCPropConsts.ins.getLocaleNameNormal(_loc2_.propId) + " " + _loc3_ + " ";
            _loc7_++;
         }
         this.txt_value.text = _loc6_;
         var _loc4_:NpcPropVo = NpcPropVo.parseStr(String(_loc5_[0]),"+");
         if(StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(param1[2]).quality,param1[1]]) != null && (StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(param1[2]).quality,param1[1]]) as StcBaowuFuwenKeyinVo).fuwen_attr > 0)
         {
            if(NumberUtil.isFloatNumber(_loc4_.oriValue))
            {
               this.propRender2.visible = false;
            }
            else
            {
               this.propRender2.visible = true;
               _loc4_.value = int(_loc4_.oriValue * (StcMgr.ins.getVoByMultiColumnValue("static_baowu_fuwen_keyin",["quality","level"],[StcMgr.ins.getItemVo(param1[2]).quality,param1[1]]) as StcBaowuFuwenKeyinVo).fuwen_attr);
               this.propRender2.dataSource = _loc4_;
               this.propRender2.ref_txt_name.style = txt_value.style;
            }
         }
         else
         {
            this.propRender2.visible = false;
         }
      }
   }
}
