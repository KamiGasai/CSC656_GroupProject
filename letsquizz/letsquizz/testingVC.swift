import UIKit

class testingVC: UIViewController {
    let question = Model()
    
    @IBOutlet weak var questionTitle: UITextView!
    
    @IBOutlet weak var numberOfCurrentQuestion: UILabel!
    
    @IBOutlet weak var answer1Title: UILabel!
    @IBAction func answer1(_ sender: UIButton) {
        question.answers[question.currentNumberOfQuestion] = answer1Title.text!
        question.answersIndex[question.currentNumberOfQuestion] = 1
        answer1Title.backgroundColor = UIColor.cyan
        answer2Title.backgroundColor = UIColor.white
        answer3Title.backgroundColor = UIColor.white
        answer4Title.backgroundColor = UIColor.white
        print("check1! /n")
    }
    
    @IBOutlet weak var answer2Title: UILabel!
    @IBAction func answer2(_ sender: UIButton) {
        question.answers[question.currentNumberOfQuestion] = answer2Title.text!
        question.answersIndex[question.currentNumberOfQuestion] = 2
        answer1Title.backgroundColor = UIColor.white
        answer2Title.backgroundColor = UIColor.cyan
        answer3Title.backgroundColor = UIColor.white
        answer4Title.backgroundColor = UIColor.white
        print("check2! /n")
    }
    
    @IBOutlet weak var answer3Title: UILabel!
    @IBAction func answer3(_ sender: UIButton) {
        question.answers[question.currentNumberOfQuestion] = answer3Title.text!
        question.answersIndex[question.currentNumberOfQuestion] = 3
        answer1Title.backgroundColor = UIColor.white
        answer2Title.backgroundColor = UIColor.white
        answer3Title.backgroundColor = UIColor.cyan
        answer4Title.backgroundColor = UIColor.white
        print("check3! /n")

    }
    
    @IBOutlet weak var answer4Title: UILabel!
    @IBAction func answer4(_ sender: UIButton) {
        question.answers[question.currentNumberOfQuestion] = answer4Title.text!
        question.answersIndex[question.currentNumberOfQuestion] = 4
        answer1Title.backgroundColor = UIColor.white
        answer2Title.backgroundColor = UIColor.white
        answer3Title.backgroundColor = UIColor.white
        answer4Title.backgroundColor = UIColor.cyan
        print("check4! /n")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        question.randomlyOrderedAnswers = question.answerOrderRandomGenerator(Answers: question.questions[question.numberOfAnswered].answers)
        questionTitle.text = question.questions[question.numberOfAnswered].questionTitle
        numberOfCurrentQuestion.text = "Question " + String(question.numberOfAnswered + 1) + "/" + String(question.answers.count)
        answer1Title.text = question.questions[question.numberOfAnswered].answers[question.counter]
        //        answer1Title.text = question.randomlyOrderedAnswers[question.counter]
        question.counter += 1
        answer2Title.text = question.questions[question.numberOfAnswered].answers[question.counter]
        //        answer2Title.text = question.randomlyOrderedAnswers[question.counter]
        question.counter += 1
        answer3Title.text = question.questions[question.numberOfAnswered].answers[question.counter]
        //        answer3Title.text = question.randomlyOrderedAnswers[question.counter]
        question.counter += 1
        answer4Title.text = question.questions[question.numberOfAnswered].answers[question.counter]
        //        answer4Title.text = question.randomlyOrderedAnswers[question.counter]
        question.counter = 0
        
        question.numberOfAnswered += 1
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if (question.currentNumberOfQuestion == question.totalQuestionNumber - 1 ||
            (question.answersIndex[question.currentNumberOfQuestion] == -1)) {
            let alert = UIAlertController(title: "", message: "Finish test?", preferredStyle: .alert)
            let backAction = UIAlertAction(title: "Back", style: .default, handler: { _ in
                // add your 
            })
            alert.addAction(backAction)
            
            self.present(alert, animated: true, completion: nil)
        } else {
            question.currentNumberOfQuestion += 1
            if (question.currentNumberOfQuestion < question.numberOfAnswered) {
                answer1Title.backgroundColor = UIColor.white
                answer2Title.backgroundColor = UIColor.white
                answer3Title.backgroundColor = UIColor.white
                answer4Title.backgroundColor = UIColor.white
                
                switch question.answersIndex[question.currentNumberOfQuestion] {
                case 1: answer1Title.backgroundColor = UIColor.cyan
                case 2: answer2Title.backgroundColor = UIColor.cyan
                case 3: answer3Title.backgroundColor = UIColor.cyan
                case 4: answer4Title.backgroundColor = UIColor.cyan
                default: print("Error!")
                }
            } else {
                answer1Title.backgroundColor = UIColor.white
                answer2Title.backgroundColor = UIColor.white
                answer3Title.backgroundColor = UIColor.white
                answer4Title.backgroundColor = UIColor.white
            }
            //        question.randomlyOrderedAnswers = question.answerOrderRandomGenerator(Answers: question.questions[question.currentNumberOfQuestion].answers)
            questionTitle.text = question.questions[question.currentNumberOfQuestion].questionTitle
            numberOfCurrentQuestion.text = "Qusetion " + String(question.currentNumberOfQuestion + 1) + "/" + String(question.answers.count)
            answer1Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer2Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer3Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer4Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter = 0
            
            if (question.currentNumberOfQuestion == question.numberOfAnswered && question.numberOfAnswered <= question.totalQuestionNumber) {
                question.numberOfAnswered += 1
            }
        }
    }
    
    
    @IBAction func lastQuestion(_ sender: UIButton) {
        if (question.currentNumberOfQuestion == 0) {
            
        } else {
            question.currentNumberOfQuestion -= 1
            answer1Title.backgroundColor = UIColor.white
            answer2Title.backgroundColor = UIColor.white
            answer3Title.backgroundColor = UIColor.white
            answer4Title.backgroundColor = UIColor.white
            
            switch question.answersIndex[question.currentNumberOfQuestion] {
            case 1: answer1Title.backgroundColor = UIColor.cyan
            case 2: answer2Title.backgroundColor = UIColor.cyan
            case 3: answer3Title.backgroundColor = UIColor.cyan
            case 4: answer4Title.backgroundColor = UIColor.cyan
            default: print("Error!")
            }
            
            //        question.randomlyOrderedAnswers = question.answerOrderRandomGenerator(Answers: question.questions[question.currentNumberOfQuestion].answers)
            questionTitle.text = question.questions[question.currentNumberOfQuestion].questionTitle
            numberOfCurrentQuestion.text = "Qusetion " + String(question.currentNumberOfQuestion + 1) + "/" + String(question.answers.count)
            answer1Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer2Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer3Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter += 1
            answer4Title.text = question.questions[question.currentNumberOfQuestion].answers[question.counter]
            question.counter = 0
        }
    }
    
    @IBAction func check(_ sender: UIButton) {
        if (question.answers[0] == question.questions[0].rightAnswer) {
            print("it works!!")
            print(question.answers)
            print("\n")
        } else {
            print("error!")
            print(question.answers)
            print("\n")
        }
    }
}

