package nslm2.modules.funnies.newYears.newYear2016s
{
   import game.ui.newYears.newYear2016s.NewYear2016RenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.newYears.newYear2016s.models.NewYear2016Service;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.funnies.npcFuncLists.NpcFuncService;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.common.uiEffects.RollFilterMed;
   import flash.filters.GlowFilter;
   import nslm2.common.compsEffects.GlowFilterBreathCtrl;
   import morn.customs.FilterLib;
   
   public class NewYear2016Render extends NewYear2016RenderUI implements IObserver
   {
       
      
      public function NewYear2016Render()
      {
         super();
         this.parts.push(new RollFilterMed(this,[new GlowFilter(16776960,1,16,16,1,1,true)],this.img_bg));
         this.parts.push(new GlowFilterBreathCtrl(FilterLib.BORDER_ORANGE).addHandler(breath_cb));
         this.img_title.centerX = 0;
         this.switchEventListeners(true);
      }
      
      public function get service() : NewYear2016Service
      {
         return NewYear2016Service.ins;
      }
      
      private function breath_cb(param1:Array) : void
      {
         this.redPoi.filters = param1;
      }
      
      private function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function get indexData() : int
      {
         return int(this.dataSource);
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(this.indexData > 0)
         {
            _loc3_ = img_bg.skin.substring(0,img_bg.skin.length - 1);
            img_bg.skin = _loc3_ + this.indexData;
            _loc2_ = img_title.skin.substring(0,img_title.skin.length - 1);
            img_title.skin = _loc2_ + this.indexData;
            this.redPoi.visible = showRedPoi();
            switch(int(this.indexData) - 1)
            {
               case 0:
                  this.box_startTime.visible = false;
                  break;
               case 1:
                  if(NpcFuncService.ins.isOpenTime(13312))
                  {
                     this.box_startTime.visible = false;
                  }
                  else
                  {
                     this.box_startTime.visible = true;
                     this.txt_startTime.text = LocaleMgr.ins.getStr(13310016);
                  }
                  break;
               case 2:
                  if(NpcFuncService.ins.isOpenTime(13313))
                  {
                     this.box_startTime.visible = false;
                     break;
                  }
                  this.box_startTime.visible = true;
                  this.txt_startTime.text = LocaleMgr.ins.getStr(13310016);
                  break;
            }
         }
      }
      
      private function showRedPoi() : Boolean
      {
         switch(int(this.indexData) - 1)
         {
            case 0:
               return NpcFuncService.ins.getVo(13311).count > 0;
            case 1:
               return NpcFuncService.ins.getVo(13312).count > 0;
            case 2:
               return NpcFuncService.ins.getVo(13313).count > 0 || NpcFuncService.ins.getVo(13314).count > 0;
         }
      }
      
      override public function dispose() : void
      {
         switchEventListeners(false);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["MSG_NPC_FUNC_VO_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_NPC_FUNC_VO_CHANGE" === _loc3_)
         {
            if(param2 == 13311 || param2 == 13312 || param2 == 13313 || param2 == 13314)
            {
               this.redPoi.visible = this.showRedPoi();
            }
         }
      }
   }
}
