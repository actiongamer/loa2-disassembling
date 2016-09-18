package nslm2.modules.cultivates.treasure.view.render
{
   import morn.core.components.Component;
   import game.ui.roleInfos.NpcPropVo;
   import proto.BaoWuBuff;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import morn.core.utils.NumberUtil;
   import morn.core.components.Clip;
   
   public class TreasureRemouldPropRender2 extends TreasureRemouldPropRender
   {
       
      
      public function TreasureRemouldPropRender2()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:Number = NaN;
         var _loc4_:Component = this.getChildByName("selectBox" + 1) as Component;
         if(_loc4_)
         {
            _loc4_.visible = false;
         }
         this.txt_null.visible = false;
         if(param1)
         {
            if(param1 is NpcPropVo)
            {
               .super.dataSource = param1;
            }
            else if(param1 is BaoWuBuff)
            {
               _loc3_ = param1 as BaoWuBuff;
               this.txt_name.text = LocaleMgr.ins.getStr(2000000000 + _loc3_.id);
               if(TreasureModel.ins.selectedTreasure.tmpRemouldId == _loc3_.id)
               {
                  _loc2_ = TreasureModel.ins.selectedTreasure.tmpRemouldVal;
               }
               else
               {
                  _loc2_ = _loc3_.value;
               }
               if(StcMgr.ins.getVoByColumnValue("static_baowu_attr","attr",_loc3_.id).fix != 1)
               {
                  if(NumberUtil.isFloatNumber(_loc2_))
                  {
                     _loc2_ = _loc2_ * 100;
                  }
                  if(NumberUtil.isFloatNumber(_loc2_))
                  {
                     this.txt_value.text = "+" + _loc2_.toFixed(1) + "%";
                  }
                  else
                  {
                     this.txt_value.text = "+" + _loc2_ + "%";
                  }
               }
               else
               {
                  this.txt_value.text = "+" + _loc2_;
               }
            }
         }
         else
         {
            this.txt_value.text = "";
            this.txt_name.text = "";
            this.txt_null.visible = true;
         }
         this.toolTip = null;
      }
      
      override public function validateName() : void
      {
         if(this.ref_txt_name)
         {
            if(vo != null)
            {
               this.showTxtName(LocaleMgr.ins.getStr(2000000000 + vo.propId));
            }
            else
            {
               this.ref_txt_name.text = "";
            }
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         var _loc6_:Component = this.getChildByName("selectBox") as Component;
         if(_loc6_)
         {
            _loc6_.visible = param1 != 1;
            if(_loc6_ is Clip)
            {
               (_loc6_ as Clip).frame = param1;
            }
         }
         var _loc2_:Component = this.getChildByName("selectBoxAll") as Component;
         if(_loc2_)
         {
            _loc2_.visible = param1 == 2 || param1 == 3;
         }
         var _loc3_:Component = this.getChildByName("selectBox" + 0) as Component;
         if(_loc3_)
         {
            _loc3_.visible = param1 == 2;
         }
         var _loc4_:Component = this.getChildByName("selectBox" + 1) as Component;
         if(_loc4_)
         {
            _loc4_.visible = false;
         }
         var _loc5_:Component = this.getChildByName("selectBox" + 2) as Component;
         if(_loc5_)
         {
            _loc5_.visible = false;
         }
      }
   }
}
