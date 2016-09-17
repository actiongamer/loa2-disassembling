package nslm2.modules.cultivates.equipGrows.upStars
{
   import game.ui.equipGrows.upStars.EquipUpStarMannalRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcEquipAddStarVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.equipGrows.EquipGrowModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.utils.TextFieldUtil;
   import flash.text.TextFormat;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.greensock.TweenLite;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class EquipUpStarMannalRender extends EquipUpStarMannalRenderUI
   {
       
      
      public function EquipUpStarMannalRender()
      {
         super();
      }
      
      public function get vo() : StcEquipAddStarVo
      {
         return this.dataSource as StcEquipAddStarVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:* = null;
         var _loc9_:* = null;
         var _loc7_:* = null;
         var _loc3_:* = null;
         var _loc8_:* = null;
         var _loc5_:* = null;
         var _loc10_:int = 0;
         var _loc2_:* = null;
         var _loc4_:* = null;
         .super.dataSource = param1;
         if(this.vo)
         {
            _loc6_ = StcMgr.ins.getItemVo(this.vo.equipId);
            if(_loc6_)
            {
               _loc9_ = EquipGrowModel.getStarLightArray(this.vo.star + 1,_loc6_.quality,"StarFromLeftToRight",false);
               this.list_stars.repeatX = _loc9_.length;
               if(_loc9_.length > 3)
               {
                  this.list_stars.x = 212;
               }
               this.list_stars.dataSource = _loc9_;
               this.label_star.text = LocaleMgr.ins.getStr(30006303) + (this.vo.star + 1);
               _loc7_ = NpcPropVo.parseStarArrStr(this.vo,this.vo.totalstep,"+");
               _loc3_ = StcMgr.ins.getEquipAddStarVo(this.vo.id + 1);
               _loc8_ = NpcPropVo.parseStr(_loc3_.extra_property,"+");
               this.label_buff.text = NPCPropConsts.ins.getLocaleNameNormal(_loc7_[0].propId) + "+" + _loc7_[0].value + "，" + TextFieldUtil.htmlText(LocaleMgr.ins.getStr(30006304) + NPCPropConsts.ins.getLocaleNameNormal(_loc8_.propId) + NPCPropConsts.ins.showValue(_loc8_.value,"+"),new TextFormat(null,null,458496));
               this.label_need.text = LocaleMgr.ins.getStr(999001133);
               _loc5_ = WealthUtil.costStrToArr(this.vo.cost);
               _loc10_ = 0;
               while(_loc10_ < _loc5_.length)
               {
                  _loc5_[_loc10_].count = _loc5_[_loc10_].count * this.vo.totalstep;
                  _loc10_++;
               }
               _loc2_ = WealthUtil.parseCostStr(this.vo.cost_red);
               _loc2_.count = _loc2_.count * this.vo.totalstep;
               _loc4_ = [];
               if(this.vo.cost == "0")
               {
                  _loc4_.push(_loc2_);
               }
               else
               {
                  _loc4_ = _loc5_;
                  _loc4_.push(_loc2_);
               }
               this.list_need.repeatX = _loc4_.length;
               if(_loc4_.length == 2 && this.vo.cost_red != "0")
               {
                  this.label_or_0.visible = true;
                  this.label_or_1.visible = false;
               }
               else if(_loc4_.length >= 3 && this.vo.cost_red != "0")
               {
                  this.label_or_0.visible = true;
                  this.label_or_1.visible = true;
               }
               else
               {
                  this.label_or_0.visible = false;
                  this.label_or_1.visible = false;
               }
               this.list_need.dataSource = _loc4_;
               TweenLite.delayedCall(0.01,hideNum);
            }
         }
      }
      
      public function hideNum() : void
      {
         var _loc3_:int = 0;
         var _loc2_:* = this.list_need.cells;
         for each(var _loc1_ in this.list_need.cells)
         {
            _loc1_.txt_num.visible = false;
         }
      }
   }
}
