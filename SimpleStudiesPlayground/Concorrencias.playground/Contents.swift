import UIKit

let startTime = CFAbsoluteTimeGetCurrent()
DispatchQueue.global().sync {
    for i in 0...10 {
        print("Fui... \(i)")
    }
}
DispatchQueue.global().sync {
    for i in 0...10 {
        print("Voltei... \(i)")
    }
}

//DispatchQueue.main.sync {
//     Executando na main thread
//}

func fetchUserId(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUserName(from server: String) async -> String {
    let userId = await fetchUserId(from: server)
    if userId == 501 {
        return "André Toti"
    }
    return "Convidado"
}

func connectUser(to server: String) async {
    async let userId = fetchUserId(from: server)
    async let userName = fetchUserName(from: server)
    let greeting = await "Olá \(userName), seu user ID é \(userId)"
    print(greeting)
}

Task {
    await connectUser(to: "primary")
}

let gallery = [
    "Summer Vacation": ["praia.png", "campo.jpg", "zoo.raw", "shopping.png"],
    "Road Trip": ["pedagio.png", "estrada.png", "curitiba.png", "praiadorosa.png"]
]

func listPhotos(inGallery name: String) async -> [String] {
    //Simulação de rede assincrona
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    } catch {}
    return gallery[name] ?? []
}

Task {
    let photoName = await listPhotos(inGallery: "Summer Vacation")
    let sortedNames = photoName.sorted()
    let name = sortedNames
}

func add(_ photo: String, toGallery: String) {
    print("Adicionando a foto \(photo) na galeria \(toGallery)")
}
func remove(_ photo: String, fromGallery: String) {
    print("Removendo a foto \(photo) da galeria \(fromGallery)")
}

Task {
    let firstPhoto = await listPhotos(inGallery: "Summer Vacation")[0]
    add(firstPhoto, toGallery: "Road Trip")
    // Neste ponto, firstPhoto está temporariamente em ambas as galerias
    remove(firstPhoto, fromGallery: "Summer Vacation")
}

func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, toGallery: destination)
    remove(photoName, fromGallery: source)
}

Task {
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
}

func downloadPhoto(named: String) async -> Data {
    // Simulando uma chamada ao backend
    do {
        try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    } catch {}
    return Data()
}

Task {
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    
    async let firstPhoto = downloadPhoto(named: photoNames[0])
    async let secondPhoto = downloadPhoto(named: photoNames[1])
    async let thirdPhoto = downloadPhoto(named: photoNames[2])
    
    let photos = await [firstPhoto, secondPhoto, thirdPhoto]
}

Task {
    await withTaskGroup(of: Data.self) { taskGroup in
        let photoNames = await listPhotos(inGallery: "Summer Vacation")
        for name in photoNames {
            taskGroup.addTask { await downloadPhoto(named: name) }
        }
    }
}

Task {
    let photo = await listPhotos(inGallery: "Summer Vacation")[0]
    let handle = Task {
        return await downloadPhoto(named: photo)
    }
    let result = await handle.value
}

actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int
    
    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

Task {
    let logger = TemperatureLogger(label: "Ao ar livre", measurement: 25)
    print(await logger.max)
}

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}

Task {
    let logger = TemperatureLogger(label: "Chaleira", measurement: 85)
    let reading = TemperatureReading(measurement: 45)
    await logger.addReading(from: reading)
}
