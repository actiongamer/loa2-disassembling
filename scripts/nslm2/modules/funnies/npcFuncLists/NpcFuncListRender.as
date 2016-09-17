package nslm2.modules.funnies.npcFuncLists
{
   import game.ui.npcFuncLists.NpcFuncListRenderUI;
   import nslm2.common.uiEffects.UITweenGlowFilterMed;
   import nslm2.common.ui.components.comps2d.others.RedPointNum;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFunctionVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.utils.ObjectUtils;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.funnies.championShip.model.ChampionShipModel;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   import org.manager.DateUtils;
   import flash.events.MouseEvent;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.footstones.resGetPoints.ResGetPointModuleParam;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import morn.customs.FilterLib;
   
   public class NpcFuncListRender extends NpcFuncListRenderUI
   {
       
      
      public var filterMed:UITweenGlowFilterMed;
      
      private var _vo:nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
      
      public function NpcFuncListRender()
      {
         super();
         this.txt_alert.mouseEvent = false;
         filterMed = new UITweenGlowFilterMed(this.img_bg,FilterLib.BORDER_YELLOW);
         this.parts.push(new UITweenGlowFilterMed(this.img_bg,FilterLib.BORDER_YELLOW));
         this.buttonMode = true;
         this.addEventListener("click",img_bg_onClick);
      }
      
      public function get redPoi() : RedPointNum
      {
         return this.redPoiUI as RedPointNum;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 is nslm2.modules.funnies.npcFuncLists.NpcFuncVo)
         {
            this.vo = param1 as nslm2.modules.funnies.npcFuncLists.NpcFuncVo;
         }
      }
      
      public function get vo() : nslm2.modules.funnies.npcFuncLists.NpcFuncVo
      {
         return _vo;
      }
      
      public function set vo(param1:nslm2.modules.funnies.npcFuncLists.NpcFuncVo) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         _vo = param1;
         var _loc5_:Boolean = _vo.isLock;
         var _loc4_:StcFunctionVo = StcMgr.ins.getFunctionVo(_vo.funcId);
         if(_loc5_)
         {
            this.txt_alert.visible = true;
            this.txt_alert.text = LocaleMgr.ins.getStr(30100044,[_loc4_.level]);
            ObjectUtils.gray(this.box1,true);
         }
         else
         {
            this.txt_alert.visible = false;
            ObjectUtils.gray(this.box1,false);
         }
         this.img_lock.visible = _loc5_;
         this.img_icon_mask.fillAlpha = 1;
         this.img_icon_mask.cacheAsBitmap = true;
         this.img_icon.cacheAsBitmap = true;
         this.img_icon.mask = this.img_icon_mask;
         this.img_icon.skin = UrlLib.npcFuncListIcon(param1.funcId);
         if(_loc5_)
         {
            this.redPoi.count = 0;
         }
         else if(param1.funcId == 11900)
         {
            this.redPoi.count = NpcFuncService.ins.getVo(11900).count;
         }
         else
         {
            this.redPoi.count = param1.count;
         }
         this.img_multiple.visible = param1.multiple > 1;
         if(param1.multiple > 1)
         {
            this.img_multiple.skin = UrlLib.npcFuncListMultiples(param1.multiple);
         }
         this.txt_title.text = LocaleMgr.ins.getStr(9100000 + param1.funcId);
         this.txt_content.text = LocaleMgr.ins.getStr(_loc4_.total_desc);
         if(vo.funcId == 50400)
         {
            if(ChampionShipModel.ins.funcOpenTime)
            {
               if(ServerTimer.ins.second < ChampionShipModel.ins.funcOpenTime)
               {
                  _loc2_ = getChampiosnShipWaitDays();
                  if(_loc2_)
                  {
                     this.txt_content.text = LocaleMgr.ins.getStr(50400901,[TimeUtils.getFullTimeStr(ChampionShipModel.ins.funcOpenTime,true,false)]);
                  }
                  else
                  {
                     this.txt_content.text = LocaleMgr.ins.getStr(50400902);
                  }
               }
            }
         }
         if(vo.funcId == 50200 && ActivityModel.ins.have(1010))
         {
            _loc3_ = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000024),LocaleMgr.ins.getStr(999000394));
         }
         if(vo.funcId == 41400 && ActivityModel.ins.have(1009))
         {
            _loc3_ = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000394));
         }
         if(vo.funcId == 41500 && ActivityModel.ins.have(1011))
         {
            _loc3_ = new ActivityDoubleTip(LocaleMgr.ins.getStr(999000445),LocaleMgr.ins.getStr(999000394));
         }
         if(_loc3_)
         {
            this.addChild(_loc3_);
            _loc3_.x = 122;
            _loc3_.y = 3;
         }
         if(vo.funcId == 40740 && StcMgr.ins.getFunctionVo(40740).isopen == 2)
         {
            this.img_lock.visible = true;
            this.img_icon_mask.fillAlpha = 1;
            this.img_icon_mask.cacheAsBitmap = true;
            this.img_icon.cacheAsBitmap = true;
            this.img_icon.mask = this.img_icon_mask;
            this.img_icon.skin = UrlLib.npcFuncListIcon(param1.funcId);
         }
      }
      
      private function getChampiosnShipWaitDays() : int
      {
         var _loc2_:DateUtils = new DateUtils();
         _loc2_.time = ChampionShipModel.ins.funcOpenTime * 1000;
         var _loc3_:int = _loc2_.date;
         var _loc1_:int = ServerTimer.ins.date.date;
         return _loc3_ - _loc1_;
      }
      
      public function changeVo(param1:nslm2.modules.funnies.npcFuncLists.NpcFuncVo) : void
      {
         _vo = param1;
         if(_vo.isLock)
         {
            this.redPoi.count = 0;
         }
         else
         {
            this.redPoi.count = _vo.count;
         }
      }
      
      override public function changeSelectState(param1:int) : void
      {
         super.changeSelectState(param1);
         switch(int(param1) - 1)
         {
            case 0:
               filterMed.switchFilter(false);
               break;
            case 1:
               filterMed.switchFilter(true);
               break;
            case 2:
               filterMed.switchFilter(false,0);
         }
      }
      
      private function img_bg_onClick(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         if(_vo.canEnter == false)
         {
            AlertUtil.floadNoOpenModule();
            return;
         }
         if(vo.funcId == 40740 && StcMgr.ins.getFunctionVo(40740).isopen == 2)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(41210135));
         }
         else if(_vo.isLock)
         {
            ModuleMgr.ins.showModule(12101,new ResGetPointModuleParam().initByLessId(int(DefindConsts.MAINHERO_LV_LESS_ID)),ModuleMgr.ins.popLayer.curModuleId);
         }
         else if(vo.funcId == 50400)
         {
            if(ChampionShipModel.ins.funcOpenTime)
            {
               if(ServerTimer.ins.second < ChampionShipModel.ins.funcOpenTime)
               {
                  _loc2_ = getChampiosnShipWaitDays();
                  if(_loc2_ != 0)
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(50400901,[TimeUtils.getFullTimeStr(ChampionShipModel.ins.funcOpenTime,true,false)]));
                  }
                  else
                  {
                     AlertUtil.float(LocaleMgr.ins.getStr(50400902));
                  }
               }
               else
               {
                  NpcFuncRef.ins.execHandler(this.vo.funcId);
               }
            }
            else
            {
               NpcFuncRef.ins.execHandler(this.vo.funcId);
            }
         }
         else if(vo.funcId == 42000)
         {
            NpcFuncRef.ins.execHandler(this.vo.funcId);
         }
         else
         {
            NpcFuncRef.ins.execHandler(this.vo.funcId);
         }
      }
   }
}
