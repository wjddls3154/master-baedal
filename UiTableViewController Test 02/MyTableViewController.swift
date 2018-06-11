
import UIKit

class MyTableViewController: UITableViewController {
    
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    var foodStoreThumbnail = ["01", "02", "03", "04", "05", "06"]
    var foodStoreAddress = ["부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 418-282","부산광역시 부산진구 양정동 418-282" ]
    var foodStoreTel = ["051-852-9969","051-852-9969","051-852-9969","051-852-9969","051-852-9969","051-852-9969"]
    
    var foodMenus = ["수육백반, 돼지국밥, 순대국밥, 내장국밥",
                     "짜장면, 짬뽕, 짬짜면, 탕수육, 탕짜면, 군만두, 양장피",
                     "떡볶이, 오뎅, 떡강정, 핫도그, 튀김",
                     "치킨마요, 참치마요, 돈불와퍼, 돈치와퍼, 돈까스카레",
                     "짬뽕, 짜장면, 짬짜면, 짬뽕밥, 볶음밥, 탕수육 "
        
                     ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "배달의 DIT"
    }

    
    
    @IBAction func editTable(_ sender: Any) {
        tableView.isEditing = true
    }
    
    
    @IBAction func nonEditTable(_ sender: Any) {
        tableView.isEditing = false
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodStoreNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath) as! FoodStoreTableViewCell

        // Configure the cell...
        
       cell.foodStoreCellName.text = foodStoreNames[indexPath.row]
        cell.foodStoreCellImage.image = UIImage(named: foodStoreThumbnail[indexPath.row])
        cell.foodStoreCellAddress.text = foodStoreAddress[indexPath.row]
        cell.foodStoreCellTel.text = foodStoreTel[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let optionMenu = UIAlertController(title: "전화걸기 : " + foodStoreNames[indexPath.row], message: foodStoreTel[indexPath.row], preferredStyle: .actionSheet)
        let callAction = UIAlertAction(title: "전화를 거시겠습니까!",
                                       style: .default){
                                        (action: UIAlertAction) -> Void in
                                        let alertMessage = UIAlertController(title : "알립니다", message: " 전화를 거는중!!", preferredStyle: .alert)
                                        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                        self.present(alertMessage, animated: true, completion: nil)
                                        
                                        
                                        
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        optionMenu.addAction(callAction)
        optionMenu.addAction(cancelAction)
        present(optionMenu, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            foodStoreNames.remove(at: indexPath.row)
//            foodStoreAddress.remove(at: indexPath.row)
//            foodStoreTel.remove(at: indexPath.row)
//            foodStoreThumbnail.remove(at: indexPath.row)
//
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//
//
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//        let tmp1 = foodStoreNames[to.row]
//        foodStoreNames[to.row] = foodStoreNames[fromIndexPath.row]
//        foodStoreNames[fromIndexPath.row] = tmp1
//
//        let tmp2 = foodStoreThumbnail[to.row]
//        foodStoreThumbnail[to.row] = foodStoreThumbnail[fromIndexPath.row]
//        foodStoreThumbnail[fromIndexPath.row] = tmp2
//
//
//
//
//    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! DetailViewController
                destinationController.title = foodStoreNames[indexPath.row]
                
                //이름 넘기기
                
                destinationController.cellImage = foodStoreThumbnail[indexPath.row]
                
                //사진 넘기기
                
               destinationController.telNum2 = foodStoreTel[indexPath.row]
                
                //번호 넘기기
                
                destinationController.loca2 = foodStoreAddress[indexPath.row]
                
                //주소 넘기기
                
                destinationController.menu = foodMenus[indexPath.row]
                
                //메뉴 넘기기
                
            }
        }
    }
    

}
