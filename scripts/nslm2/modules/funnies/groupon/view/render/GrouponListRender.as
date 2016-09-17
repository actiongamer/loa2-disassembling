package nslm2.modules.funnies.groupon.view.render
{
   import game.ui.groupon.render.GrouponListRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.modules.funnies.groupon.vo.GrouponVo;
   import nslm2.utils.ServerTimer;
   import nslm2.utils.RTools;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class GrouponListRender extends GrouponListRenderUI implements IObserver
   {
       
      
      private var _data:GrouponVo;
      
      public function GrouponListRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         .super.dataSource = param1;
         _data = param1 as GrouponVo;
         if(_data)
         {
            if(_data.openStamp <= ServerTimer.ins.second)
            {
               _loc2_ = 30000718;
               if(ServerTimer.ins.second >= _data.endStamp)
               {
                  _loc2_ = 30000722;
               }
            }
            else
            {
               _loc2_ = 30000719;
            }
            checkRedPoint();
            txt_name.text = RTools.getShortString(_data.sellItem.showName);
            if(_data.sellItem.showName.length > 15)
            {
               this.toolTip = _data.sellItem.showName;
            }
            txt_stauts.text = LocaleMgr.ins.getStr(_loc2_);
            txt_name.size = RTools.cl(12,14);
            txt_stauts.size = RTools.cl(12,14);
            iconRender.dataSource = _data.sellItem;
            ObserverMgr.ins.regObserver(this);
         }
         else
         {
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      private function checkRedPoint() : void
      {
         if(!this._data)
         {
         }
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("groupon_notice_update_detail" === _loc3_)
         {
            checkRedPoint();
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["groupon_notice_update_detail"];
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
   }
}
