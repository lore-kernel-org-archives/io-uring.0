Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F77D239567
	for <io-uring@vger.kernel.org>; Tue, 24 Feb 2026 16:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949541; cv=none; b=t3+RfuDtoJDcJjpdT40wspi/JeDIFzt2drPiSRWSt0mT6g9PUTBSrCgDVJkAYY9TlTKoOskEtD/qfvtUroIumT3nS/k50RW+TThZ1ppQnREtNUGKkiLAFY3qRQVACYpAtEAKCfLhpQDf1N+SN1wSDxUEwhNop4scLEpAk5roCXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949541; c=relaxed/simple;
	bh=wEMjd9EqPion2st/U4PA6GZUOr40c40T/3en+uOZUis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rrZPFLZeEm2T5GEecm1HAuo4mCcobSoeE312qKh00vfan35+6CSySNNsHNH0NSj1fn0/aGY2M5SApFnhxIuL0ixo+QVkiaWaONUiXhZvkChq+ao1uWDPrFklDIEautCJtIGQJ5gi1za/tJJYJGePMuIFoeYdhLuRFVf4OTW9COQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iL1mSJID; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iL1mSJID"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-436e87589e8so5476956f8f.3
        for <io-uring@vger.kernel.org>; Tue, 24 Feb 2026 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949538; x=1772554338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c4FViPNTl+jpGZwvf9gITFlieRR141hkmpbs/wBBkiI=;
        b=iL1mSJIDi+kPvn+KOUDiMkIuKLPRC8bof43aOrJWvcoPFie9ycBLBLucs9jM0w6RaF
         eJGI+DlPA1nLgrUE+szn6y9qJMXFIi1KN4jibMBesKGLHWtyKz34lZ3D3ACl9bq8wWRo
         iCEBCteEl+91WcFF+sIElb902ZOSM/G7HpXaCX/1tU1//3/qgVXpRFlVd9QwHRKGDAea
         IzWYazin6rwJC2EFyF1NU8pqoNDXyZyuJqTeLVnVIBjfVmFDKPiPs+t7JNv6BYnHT30w
         cctxybKYanf6rOhIf5E2hbTDaXGGSjYSBmkmRmvnXtsNcuJGw51K9okW+lHqro4TJjp3
         yp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949538; x=1772554338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c4FViPNTl+jpGZwvf9gITFlieRR141hkmpbs/wBBkiI=;
        b=ifvc7fdfnIxZayGeREerpzpHAPWmiHZlj47EMg/wiBfC2shYhgYOcs0Nemt9YGZeLB
         /t6slpdvcj1iO4TsWaX0HJ3SAElAz95xSPzlKNUrXtySGHOiTkEGUEhF1wsHAjjjv9GN
         Htx/k2pyiEeAFEta1xVjiOF9jLSHqb2jQTRq38krkcfObm0ggraXJzlBFZBka+LBMT86
         uJugeeh83xyTSPhBf2/zjDc8cyYpfSr9T1KSMg0MnME0jH7u+W8pZtdM0/71OI1riXx/
         FwVQbHIok6XGvi1VC0QerdAutD013eZltA/1pxdj6zNd9cjTX+lZ6IFSrwaJBxOZRrt9
         GnUQ==
X-Gm-Message-State: AOJu0Yyd2+TcIsR72FTHYuzMPFcZ7GnS2eRY9JnbOFFPv0QvBU2vJzyC
	5INvJ8UrkM7XjUTBoVcyC7ghWjrxITU6/JwnE/VbJR1TYYGbDUe7o249eu+FSA==
X-Gm-Gg: ATEYQzy/ssWB3XnlXQqWmTkABPaa+9yMrCSqxu1/FepPD/DBaf/6uCIvXj6sCxNhOPz
	a2ha+seOjhMBL7AJhUifGYAfsPDeGIxAoa7a8YMsASE00v9dyqC/Pxp9vQWpNBjhxLo1swsRcjm
	rGwR9SGca+XqBuRQrmAbh6lWgAS99tox3R9QYet0ZFH2Oi+6yYGdbb7DOyArYVBANWiAziuELFx
	doYtIhi+odVth8xLvJG9DH8hsYYmhwqGkvznUkRP7Pfw4lHYLghVn4KUZSERtIr/3ascG7vjhY/
	mKews3vJO2chA6GbPqkSU2Z2YYcli8k4V4yDXx87gRnGcwJhf9UDu5Bv841DgAGqzq9nnuX9A/9
	gi5CGw72uDS/UkWcuk8efhBf1DWfmJRuCH8ovt+HFOis7Kf5NuH/R1Ur8+YuorwVUpaOuHTHRbr
	w7GPk5AVAk5zzG7IGPCPN7xhFXNpcsmwtW0uDqF8OcdsmnJX92JHZs2b7Gs8kDztookEbLCs/tY
	+pwvSsXvAcFYTX06bLes/4JD1WfpA==
X-Received: by 2002:a05:6000:2401:b0:439:8da3:d786 with SMTP id ffacd0b85a97d-4398da3d876mr695554f8f.11.1771949537992;
        Tue, 24 Feb 2026 08:12:17 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43987f3ed03sm6292977f8f.16.2026.02.24.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:12:17 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: io-uring@vger.kernel.org
Cc: asml.silence@gmail.com,
	axboe@kernel.dk
Subject: [PATCH 0/2] timeout immediate arg
Date: Tue, 24 Feb 2026 16:12:09 +0000
Message-ID: <cover.1771949518.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow the user to pass the timeout value inside the SQE instead of
pointing to a timespec, people asked for it as it makes user space
simpler. More details description is in Patch 2.

Pavel Begunkov (2):
  io_uring/timeout: READ_ONCE sqe->addr
  io_uring/timeout: immediate timeout arg

 include/uapi/linux/io_uring.h |  5 +++++
 io_uring/timeout.c            | 11 +++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0

