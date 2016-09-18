package nslm2.modules.battles.heroAwakenRoad.vo
{
   import nslm2.mgrs.stcMgrs.vos.StcConstellationVo;
   import nslm2.modules.battles.heroAwakenRoad.model.HeroAwakenRoadModel;
   import proto.JueRoadNodeInfo;
   
   public class HeroAwakenNodeVo
   {
       
      
      public var stcVo:StcConstellationVo;
      
      public var gotStar:int;
      
      public var status:int = 3;
      
      private var model:HeroAwakenRoadModel;
      
      public function HeroAwakenNodeVo()
      {
         model = HeroAwakenRoadModel.ins;
         super();
      }
      
      public function get sort() : int
      {
         return stcVo.sort;
      }
      
      public function updateData(param1:JueRoadNodeInfo) : void
      {
         var _loc2_:int = 0;
         if(model.preStageId == this.id)
         {
            _loc2_ = model.preProcessInfos.getValue(this.id);
            if(_loc2_ != param1.stars)
            {
               model.addStarCnt = param1.stars - _loc2_;
            }
            else
            {
               model.addStarCnt = 0;
            }
         }
         model.preProcessInfos.put(this.id,param1.stars);
         gotStar = param1.stars;
         if(gotStar)
         {
            status = 1;
         }
      }
      
      public function get offset_x() : int
      {
         return stcVo.offset.split("|")[0];
      }
      
      public function get offset_y() : int
      {
         return stcVo.offset.split("|")[1];
      }
      
      public function get id() : int
      {
         return stcVo.id;
      }
      
      public function get consumeCnt() : Boolean
      {
         return this.gotStar > 0;
      }
   }
}
