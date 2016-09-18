package nslm2.modules.battles.heroAwakenRoad.view.saodang
{
   import game.ui.heroAwakenRoad.saodang.HeroAwakenSaoDangMainRenderUI;
   import nslm2.modules.Chapters.saodang.SaodangVo;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import proto.Item;
   import proto.Reward;
   import proto.ExpHeroInfo;
   import proto.HeroInfo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class HeroAwakenSaoDangMainRender extends HeroAwakenSaoDangMainRenderUI
   {
      
      private static const IMG_SAO_DANG_CPL:String = "img_saoDangCpl";
      
      private static const IMG_TOTAL:String = "img_total";
       
      
      private var _value:SaodangVo;
      
      private var $activityDoubleTip:ActivityDoubleTip;
      
      public function HeroAwakenSaoDangMainRender()
      {
         super();
         this.img_total.url = UrlLib.moduleLocaleImg(40400,"img_total");
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:Boolean = false;
         _value = param1 as SaodangVo;
         if(_value != null)
         {
            if($activityDoubleTip)
            {
               $activityDoubleTip.visible = false;
            }
            if(_value.isComplete == true)
            {
               this.box_main.visible = false;
               this.box_cpl.visible = true;
               this.list_has.dataSource = _value.hasArr;
               this.box_total.visible = false;
            }
            else if(_value.addExp != 0 || _value.addItemsArr && _value.addItemsArr.length > 0)
            {
               this.render_gold.wealthVo = WealthUtil.needVo(1,0,_value.addGold);
               this.render_exp.wealthVo = WealthUtil.needVo(10,0,_value.addExp);
               _loc3_ = [];
               _loc3_ = _loc3_.concat(this.getAddItems(_value.addItemsArr));
               _loc3_ = _loc3_.concat(this.getHeros(_value.addHerosArr));
               this.list_item.dataSource = _loc3_;
               if(_loc3_.length > 0)
               {
                  this.list_item.visible = true;
                  this.txt_saodangResult.visible = false;
                  _loc2_ = false;
                  if(ActivityModel.ins.have(1025))
                  {
                     _loc2_ = true;
                  }
                  if(_loc2_)
                  {
                     if($activityDoubleTip == null)
                     {
                        $activityDoubleTip = new ActivityDoubleTip();
                        this.addChild($activityDoubleTip);
                        $activityDoubleTip.x = -4;
                        $activityDoubleTip.y = 42;
                     }
                     else
                     {
                        $activityDoubleTip.visible = true;
                     }
                  }
               }
               else
               {
                  this.txt_saodangResult.visible = true;
               }
               this.txt_title.text = LocaleMgr.ins.getStr(350010013,[_value.index]);
               this.render_gold.visible = _value.addGold > 0;
               this.box_cpl.visible = false;
               this.box_main.visible = true;
            }
            else
            {
               this.txt_title.text = LocaleMgr.ins.getStr(350010013,[_value.index]);
               this.list_item.visible = false;
               this.render_gold.visible = false;
               this.box_cpl.visible = false;
               this.box_main.visible = true;
            }
         }
      }
      
      override public function dispose() : void
      {
         if($activityDoubleTip)
         {
            $activityDoubleTip.dispose();
            $activityDoubleTip = null;
         }
         super.dispose();
      }
      
      private function getAddItems(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_ is Item)
            {
               _loc2_.push(WealthUtil.createItemVo(_loc3_.itemId,_loc3_.count));
            }
            else if(_loc3_ is Reward)
            {
               _loc2_.push(WealthUtil.rewardToVo(_loc3_));
            }
         }
         return _loc2_;
      }
      
      private function getExpheros(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(WealthUtil.createNpcVo(_loc3_.id,_loc3_.count));
         }
         return _loc2_;
      }
      
      private function getHeros(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_.push(WealthUtil.createNpcVo(_loc3_.baseInfo.baseId));
         }
         return _loc2_;
      }
   }
}
